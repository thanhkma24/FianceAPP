# Base

Base flutter with Bloc, localization, network dio

## Base using Bloc authentication:

```dart
    class WrapperApplication extends StatelessWidget {
      final Widget child;
      final AuthService authService;
    
      const WrapperApplication(
          {Key? key, required this.child, required this.authService})
          : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return RepositoryProvider<AuthService>(
          create: (BuildContext context) {
            return authService;
          },
          child: BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) {
              final authService = RepositoryProvider.of<AuthService>(context);
              return AuthenticationBloc(authService)..add(AppLoadedWithAuth());
            },
            child: child,
          ),
        );
      }
    }
```

## Base using Localization with mixin in package localizations

```dart
    mixin LocalizationMixin<T extends StatefulWidget> on State<T> {
      Locale? locale;
    
      @protected
      Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates => [
            Translate.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ];
    
      @protected
      LocaleResolutionCallback? get localeResolutionCallback => Translate.delegate
          .resolution(fallback: Locale.fromSubtags(languageCode: "vi"));
    
      @protected
      Iterable<Locale> get supportedLocales => Translate.delegate.supportedLocales;
    
      @mustCallSuper
      @override
      void initState() {
        locale = Translate.delegate
            .getLocaleCurrent(context, Locale.fromSubtags(languageCode: "vi"));
        AppLocale.onChangedLocale = (locale) {
          setState(() {
            this.locale = locale;
          });
        };
        super.initState();
      }
    
      @mustCallSuper
      @override
      void dispose() {
        AppLocale.onChangedLocale = null;
        super.dispose();
      }
    }
```

## Base using network dio

```dart
    class APIClient {
      late final Dio _dio;
    
      APIClient.init(
          {Config? config,
          HeaderAuthorized? headerAuthorized,
          MsgErrorHandler? msgErrorHandler,
          List<Interceptor>? interceptors}) {
        final dioConfig = config;
        _dio = Dio(dioConfig?.toOptions());
        setInterceptors(
            interceptors ?? List.empty(), headerAuthorized, msgErrorHandler);
      }
    
      setInterceptors(List<Interceptor> interceptors,
          HeaderAuthorized? headerAuthorized, MsgErrorHandler? msgErrorHandler) {
        //add log without mode release
        if (!kReleaseMode)
          _dio.interceptors
              .add(LogInterceptor(requestBody: true, responseBody: true));
        //add interceptor
        _dio.interceptors.addAll([
          HeaderInterceptor(headerAuthorized),
          AuthorizedInterceptor(_dio, headerAuthorized),
          ErrorHandleInterceptor(msgErrorHandler),
          ...interceptors
        ]);
      }
    
      Dio get() => _dio;
    }
```