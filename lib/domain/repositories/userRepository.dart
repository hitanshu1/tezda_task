import '../../Widgets/Widgets.dart';
import '../../core/utils/getStorage.dart';
import '../../data/data_sources/http_source.dart';
import '../../data/models/Widgets/httpResult.dart';
import '../../data/models/user.dart';
import '../apiUrls.dart';

/// user repository
class UserRepository {
  UserRepository._();

  /// instance of product repository
  static final UserRepository instance = UserRepository._();

  /// get http service
  HttpService get service => HttpService.instance;
  final Map<String, String> _headers = {
    'Authorization': 'Bearer ${AppGetXStorage.instance.getUser.accessToken}'
  };

  /// get user details
  Future<UserModel> getDetails() async {
    final response =
        await service.getRequest(Apiurls.profile, headers: _headers);
    if (response.isSuccess) {
      return UserModel.fromJson(response.json);
    } else {
      Widgets.showToast(response.message);
      return UserModel.invalidUser();
    }
  }

  /// update user details
  Future<HttpResult> updateDetails(UserModel model) async {
    final response = await service.putRequest(
        Apiurls.updateProfile(model.id.toString()),
        headers: _headers,
        body: model.toJson);
   
    return response;
  }
}
