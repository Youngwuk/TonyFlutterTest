import 'package:dio/dio.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/model/user.dart';

class UserClient {
  late Dio _dio;

  Future<User?> fetchUserInfo(String userId) async {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://regres.in/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "Content-Type": 'application/json'
      }
    );

    _dio = Dio(options);

    Response response = await _dio.get('/user/$userId');

    if (response.statusCode == 200) {
      User user = User.fromJson(response.data);
      return user;
    }
    return null;
  }
}