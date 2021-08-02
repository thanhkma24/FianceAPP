import 'dart:async';

import 'package:example/bloc/search/search_event.dart';
import 'package:example/bloc/search/search_state.dart';
import 'package:example/bloc/search/search_state.dart';
import 'package:example/model/transaction.dart';
import 'package:example/ui/tab1/fake_data.dart';

import 'search_state.dart';

class SearchBloc{

  var listResutl = SearchState(transactionData);
  final eventController = StreamController<SearchEvent>();
  final stateController = StreamController<SearchState>();

  SearchBloc(){
    eventController.stream.listen((event) {
      if(event is SearchEventIpl)
        listResutl.listTransac = transactionData.where((element) => element.name.toLowerCase().contains(event.textSearch)).toList();

      stateController.sink.add(listResutl);
    });
  }

  void dispose(){
    eventController.close();
    stateController.close();
  }

}