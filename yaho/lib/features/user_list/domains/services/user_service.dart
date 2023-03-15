import '../models/user_request.dart';
import '../models/user_response.dart';

abstract class UserService{
  Future<List<User>> getListUser(UserRequest userRequest);
}