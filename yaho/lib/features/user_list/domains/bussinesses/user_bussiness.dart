import 'package:yaho/features/user_list/domains/models/user_request.dart';

import '../models/user_response.dart';
import '../services/user_service.dart';

class UserBussiness {
  final UserService userService;
  final List<User> _listUser = [];
  int page = 1;

  UserBussiness(this.userService);

  List<User> get listUser => _listUser;

  Future<void> initListUser() async {
    final result = await userService.getListUser(UserRequest(page));
    if (result.isEmpty) return;
    _listUser.addAll(result);
    _listUser.add(User.fake());
  }

  Future<void> loadMore() async {
    page++;
    final result = await userService.getListUser(UserRequest(page));
    if (result.isEmpty) return;
    _listUser.removeWhere((element) => element.isFake);
    _listUser.addAll(result);
    _listUser.add(User.fake());
  }
}
