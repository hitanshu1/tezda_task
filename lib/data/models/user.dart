import '../../Extensions/Extensions.dart';
import '../../core/constants/constants.dart';
import 'Model.dart';

///User model
class UserModel extends Model {
  /// user id
  final int id;
  /// name
 final String name;
  /// email
 final String email;
  /// password
 final String password;
 /// role
 final String role;
 /// avatar
 final String avatar;
/// constructor
  UserModel({required this.id,required this.name,required this.email,required this.password,required this.role,required this.avatar});

  @override
  UserModel copyWith(
      {String? name,
      String? email,
      String? password,
      String? role,
      String? avatar}) {
    return UserModel(
      id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role,
        avatar: avatar ?? this.avatar);
  }

  @override
 
  Json get toJson => {
        'name': name,
        'email': email,
        'password': password,
        'role': role,
        'avatar': avatar
      };
/// User model from Json
 factory UserModel.fromJson(Json json) {
  if(json.isEmpty){
    return UserModel.invalidUser();
  }
    return UserModel(
      id:  json.id,
        name: json.safeString('name'),
        email: json.safeString('email'),
        password: json.safeString('password'),
        role: json.safeString('role'),
        avatar: json.safeString('avatar')
        );
  }

  /// Create and return a UserModel object with default values for an invalid user.
  static UserModel invalidUser() {
    return UserModel(
      id: 0,
        name: 'Not logged in',
        email: '',
        password: '',
        role: '',
        avatar: '');
  }
  /// Create and return a UserModel object with default values for a checking user.
  static  UserModel checkingUser() {
    return UserModel(
      id: 0,
        name: 'Checking',
        email: '',
        password: '',
        role: '',
        avatar: '');
  }
}
