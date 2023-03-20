part of 'user_list_bloc.dart';

class UserListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserGridViewLoaded extends UserListState {
  final List<User> listUser;
  UserGridViewLoaded(this.listUser);
  @override
  List<Object?> get props => [listUser];
}

class UserListViewLoaded extends UserListState {
  final List<User> listUser;
  UserListViewLoaded(this.listUser);
  @override
  List<Object?> get props => [listUser];
}
