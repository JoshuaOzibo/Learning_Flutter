abstract class LoginInAuthRepository {
  Future<List<Map<dynamic, String>>> authRemoteDataSourceFunc(
    Map<String, String> email,
    password,
  );
}

class LoginInAuthRepositoryImpl extends LoginInAuthRepository {
  @override
  Future<List<Map<dynamic, String>>> authRemoteDataSourceFunc(
    Map<String, String> email,
    password,
  ) {
    // TODO: implement authRemoteDataSourceFunc
    print(email);
    print(password);
    throw UnimplementedError();
  }
}
