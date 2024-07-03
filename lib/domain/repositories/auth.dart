import '../../data/data_sources/http_source.dart';
import '../../data/models/Widgets/httpResult.dart';
import '../../data/models/firebase/authCredentials.dart';
import '../apiUrls.dart';

/// auth repository
class AuthRepository {
  /// private constructor
  AuthRepository._privateConstructor();
  static final AuthRepository _instance = AuthRepository._privateConstructor();

  ///To access the repo quickly
  static AuthRepository get instance => _instance;

  /// get http service
  HttpService get service => HttpService.instance;

  /// login
  Future<HttpResult> login(AppAuthCredentials credentials) async {
    final Map<String, String> _body = {
      'email': credentials.email,
      'password': credentials.password,
    };

    final response = await service.postRequest(Apiurls.login, body: _body);
    
    return response;
  }

  ///Register a user with the provided credentials and return a Future of HttpResult.
  Future<HttpResult> register(AppAuthCredentials credentials) async {
    final Map<String, String> _body = {
      'name': credentials.name??'',
      'password': credentials.password,
      'email': credentials.email,
      'avatar': 'https://picsum.photos/800',
    };
    print(_body);
    final response = await service.postRequest(Apiurls.register, body: _body);
    
    return response;
  }
}
