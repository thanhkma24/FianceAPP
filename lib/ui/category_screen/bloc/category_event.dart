part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryGetAllEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategoryAdd extends CategoryEvent {
  final TransactionGroupModel transactionGroupModel;

  CategoryAdd({required this.transactionGroupModel});

  @override
  // TODO: implement props
  List<Object?> get props => [transactionGroupModel];
}

class CategoryEdit extends CategoryEvent {
  final int id;

  CategoryEdit(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class CategoryDelete extends CategoryEvent {
  final int id;

  CategoryDelete(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
