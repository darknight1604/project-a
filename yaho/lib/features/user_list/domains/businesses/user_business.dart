import 'package:yaho/features/user_list/domains/models/user_request.dart';

import '../models/user_response.dart';
import '../services/user_service.dart';

class UserBusiness {
  final UserService userService;
  final List<User> _listUser = [];
  int page = 1;

  UserBusiness(this.userService);

  List<User> get listUser => _listUser;

  Future<void> initListUser() async {
    final UserResponse? result =
        await userService.getUserResponse(UserRequest(page));
    if (result == null) return;
    if (result.listUser.isEmpty) return;
    _listUser.addAll(result.listUser);
    _listUser.add(User.fake());
  }

  Future<void> loadMore() async {
    page++;
    final UserResponse? result =
        await userService.getUserResponse(UserRequest(page));
    if (result == null) return;

    if (result.listUser.isEmpty) {
      return;
    }
    _listUser.removeWhere((element) => element.isFake);
    _listUser.addAll(result.listUser);
    int currentTotal = _listUser.length;
    if (currentTotal < (result.total ?? 0)) {
      _listUser.add(User.fake());
    }
  }
}
