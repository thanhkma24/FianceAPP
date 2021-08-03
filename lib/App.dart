import 'package:common/common.dart';
import 'package:example/data/services/database_handler.dart';
import 'package:example/repository/category/category_repository.dart';
import 'package:example/ui/borrowlend/borrow_lend.dart';
import 'package:example/ui/category_screen/bloc/category_bloc.dart';
import 'package:example/ui/category_screen/category_transactions.dart';
import 'package:example/ui/mobile_home.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:example/ui/borrowlend/borrow_lend.dart';
import 'package:example/ui/tab1/search_transaction/search_transac_detail.dart';
import 'package:sqflite/sqflite.dart';

// File App
// @project example
// @author hoangminhk4b on 14-07-2021
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late final Database database;

  @override
  void initState() {
    getDb();
    super.initState();
  }

  void getDb() async {
    database = (await DatabaseHandler.instance.database)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    if (Translate.delegate
                            .getLocaleCurrent(context)
                            ?.languageCode ==
                        "vi")
                      Translate.delegate
                          .loadAndSave(Locale.fromSubtags(languageCode: 'en'));
                    else
                      Translate.delegate
                          .loadAndSave(Locale.fromSubtags(languageCode: 'vi'));
                  },
                  child: Text(Translate.of(context).language)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => MobileHome()));
                  },
                  child: Text("TabBar 📲")),
              TextButton(
                  onPressed: () {
                    print("aaaaa");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => BorRowLend()));
                  },
                  child: Text("LoanScreen ")),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>BlocProvider<CategoryBloc>(
                          create: (_) => CategoryBloc(
                              CategoryRepositoryImpl(database: database)),
                          child: CategoryScreen(),
                        ) ),
                  );
                },
                child: Text('Category Transaction Screen'),
              ),
              TextButton(onPressed: () {
                context.read<AuthenticationBloc>().add(AppLoginEvent());
              }, child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  final status = state.status;
                  final text = status == AuthenticationStatus.authenticated
                      ? "authenticated"
                      : "unauthenticated";
                  return Text(text);
                },
              ))
            ],
          )),
    );
  }
}
