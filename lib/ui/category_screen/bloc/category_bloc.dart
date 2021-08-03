import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/data/model/transaction_group_model.dart';
import 'package:example/repository/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository _categoryRepository;
  CategoryBloc(this._categoryRepository) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if(event is CategoryAdd)
      {
        yield* _mapInsertCategory(event);
      }
    else if(event is CategoryGetAllEvent)
      {
        yield* _mapLoadListCategory();
      }
  }

  Stream<CategoryState> _mapLoadListCategory() async*
  {
    yield CategoryLoading();
    try{
      var data = await _categoryRepository.getAllCategory();
      if(data.isNotEmpty)
        {
          yield CategoryLoadListedCategory(data);
        }
      else
        {
          yield  CategoryError('Hiện Chưa có dữ liệu');
        }
    }catch(e)
    {
      yield CategoryError(e.toString());
    }
  }
  Stream<CategoryState> _mapInsertCategory(CategoryAdd event) async*
  {
    yield CategoryLoading();
    try{
      var data = await _categoryRepository.insertCategory(event.transactionGroupModel);
      if(data == 0)
        {
          yield CategoryLoaded();
        }
      else {
        yield CategoryError('Chưa insert đc');
      }
    }catch(e)
    {
      yield CategoryError(e.toString());
    }
  }
}
