import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domains/bussinesses/user_bussiness.dart';
import '../../domains/models/user_response.dart';
import '../../domains/services/user_service.dart';
part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  late UserBussiness _userBussiness;

  UserListBloc(UserService userService) : super(UserListInitial()) {
    _userBussiness = UserBussiness(userService);
    on<FetchUserListEvent>((event, emit) async {
      emit(UserListLoading());
      await _userBussiness.initListUser();
      emit(UserListLoaded(_userBussiness.listUser));
    });
    on<LoadMoreUserListEvent>((event, emit) async {
      emit(UserListLoading());
      await _userBussiness.loadMore();
      emit(UserListLoaded(_userBussiness.listUser));
    });
  }
}
