import 'package:equatable/equatable.dart';

/// login event
abstract class LoginEvent extends Equatable {
  /// constructor
  const LoginEvent();

  @override
  List<Object> get props => [];
}

///To check if the current user is already logged in or not
class CheckAuthEvent extends LoginEvent {
  @override
  List<Object> get props => [DateTime.now().millisecondsSinceEpoch];
}

/// login button pressed event
class LoginButtonPressed extends LoginEvent {

  /// email
  final String email;

  /// password
  final String password;

  /// constructor
  const LoginButtonPressed(
      {required this.email, required this.password, });

  @override
  List<Object> get props => [email, password];
}
/// register button pressed event
class  RegisterButtonPressed extends LoginEvent {
  /// name
 final String ? name;
 /// email
 final String  email;
 /// password
 final String  password;

  /// constructor
  const RegisterButtonPressed(
      {required this.email, required this.password, this.name});
      @override
 
  List<Object> get props => [email, password];
  
}
/// logout button pressed event
class LogoutEvent extends LoginEvent {}

/// change view
class ChangeLoginViewEvent extends LoginEvent {
  /// isLogin
  final bool isLogin;

  /// constructor
  const ChangeLoginViewEvent({required this.isLogin});
  @override
  List<Object> get props => [isLogin];
}
