part of 'user_list_bloc.dart';

class UserListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<User> listUser;
  UserListLoaded(this.listUser);
  @override
  List<Object?> get props => [listUser];
}
