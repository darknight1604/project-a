part of 'user_list_bloc.dart';

class UserListEvent {}

class FetchUserListEvent extends UserListEvent {}

class LoadMoreUserListEvent extends UserListEvent {}

class ViewModeListUserEvent extends UserListEvent {
  // true -> ListView
  // false -> GridView
  final bool isListView;
  ViewModeListUserEvent(this.isListView);
}
