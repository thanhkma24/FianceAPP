part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}
class CategoryLoading extends CategoryState{}
class CategoryError extends CategoryState{
  String error;

  CategoryError(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class CategoryLoaded extends CategoryState{}
class CategoryLoadListedCategory extends CategoryState{
 final List<TransactionGroupModel> list;

  CategoryLoadListedCategory(this.list);
  @override
  // TODO: implement props
  List<Object> get props =>[list];
}