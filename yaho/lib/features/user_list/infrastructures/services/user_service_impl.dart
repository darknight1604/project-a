import 'package:yaho/features/user_list/domains/models/user_response.dart';
import 'package:yaho/features/user_list/domains/services/user_service.dart';
import 'package:yaho/features/user_list/infrastructures/repositories/user_repository.dart';

class UserServiceImpl extends UserService {
  final UserRepository _repository = UserRepository();

  @override
  Future<List<User>> getListUser(userRequest) async {
    UserResponse? userResponse = await _repository.getListUser(userRequest);
    if (userResponse == null) {
      return [];
    }
    return userResponse.data ?? [];
  }
}
