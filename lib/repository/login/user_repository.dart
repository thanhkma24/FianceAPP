// File user_repository
// @project example
// @author hoangminhk4b on 15-07-2021
import 'package:network/network.dart';

abstract class UserRepository {
  Future login(String username, String password);
}

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<Map<String,dynamic>> login(String username, String password) async {
     final result = await _dio.post("iam/api/v0/login-with-ldap",
        data: {"username": username, "password": password});
     return result.data as Map<String,dynamic>;
  }
}
