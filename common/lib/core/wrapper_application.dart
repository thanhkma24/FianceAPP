import 'package:common/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// File WrapperApplication
// @project example
// @author hoangminhk4b on 10-07-2021
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
