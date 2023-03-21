import '../models/user_request.dart';
import '../models/user_response.dart';

abstract class UserService{
  Future<UserResponse?> getUserResponse(UserRequest userRequest);
}