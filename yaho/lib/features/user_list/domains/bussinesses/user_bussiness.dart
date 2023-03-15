import 'package:yaho/features/user_list/domains/models/user_request.dart';

import '../models/user_response.dart';
import '../services/user_service.dart';

class UserBussiness {
  final UserService userService;
  final List<User> _listUser = [];
  int page = 0;

  UserBussiness(this.userService);

  List<User> get listUser => _listUser;

  Future<void> initListUser() async {
    final result = await userService.getListUser(UserRequest(page));
    _listUser.addAll(result);
  }

  Future<void> loadMore() async {
    page++;
    final result = await userService.getListUser(UserRequest(page));
    _listUser.addAll(result);
  }
}
