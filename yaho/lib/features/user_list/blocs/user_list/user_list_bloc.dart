import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domains/bussinesses/user_bussiness.dart';
import '../../domains/models/user_response.dart';
import '../../domains/services/user_service.dart';
part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  late UserBussiness _userBussiness;
  late bool _isListView;

  UserListBloc(
    UserService userService,
  ) : super(UserListInitial()) {
    _userBussiness = UserBussiness(userService);
    _isListView = false;
    on<FetchUserListEvent>((event, emit) async {
      emit(UserListLoading());
      await _userBussiness.initListUser();
      await updateUi(emit);
    });
    on<LoadMoreUserListEvent>((event, emit) async {
      emit(UserListLoading());
      await _userBussiness.loadMore();
      await updateUi(emit);
    });
    on<SwitchModeListUserEvent>((event, emit) async {
      emit(UserListLoading());
      _isListView = !_isListView;
      await updateUi(emit);
    });
  }

  Future<void> updateUi(emit) async {
    if (_isListView) {
      emit(UserListViewLoaded(_userBussiness.listUser));
      return;
    }
    emit(UserGridViewLoaded(_userBussiness.listUser));
  }
}
