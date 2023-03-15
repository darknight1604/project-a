import 'package:dio/dio.dart';
import 'package:yaho/features/user_list/domains/models/user_response.dart';

import '../../../../core/clients/dio_client.dart';
import '../../domains/models/user_request.dart';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._();
  final DioClient _dioClient = DioClient();

  UserRepository._();

  factory UserRepository() => _userRepository;

  Future<UserResponse?> getListUser(UserRequest request) async {
    Response response = await _dioClient.requestGet(
      'users/',
      queryParameters: request.toJson(),
    );
    return UserResponse.fromJson(response.data);
  }
}
