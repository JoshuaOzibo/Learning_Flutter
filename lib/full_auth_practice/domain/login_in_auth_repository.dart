import 'package:flutter_application_1/full_auth_practice/models/signin/sign_in_types.dart';

abstract class LoginInAuthRepository {
  Future<List<Map<dynamic, String>>> authRemoteDataSourceFunc(
    Map<String, String> email,
    password,
  );
}

// class LoginInAuthRepositoryImpl extends LoginInAuthRepository {
//   @override
//   Future<SignInTypes> authRemoteDataSourceFunc(String loginDetails) {
//     return;
//   }
// }
