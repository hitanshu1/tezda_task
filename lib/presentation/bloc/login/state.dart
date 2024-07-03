import 'package:equatable/equatable.dart';

import '../../../core/constants/enums/authStatus.dart';

/// login state
class LoginState extends Equatable {
  ///
  /// login state
  final Authstatus status;
/// view login
  final bool isLogin;

  /// constructor
  const LoginState({this.status = Authstatus.unAuthenticated,this.isLogin = true});

  @override
  List<Object> get props => [status];

  /// Creates a new instance of [LoginState] with an optional [status] parameter.
  ///
  /// If [status] is not provided, the new instance will have the same [status]
  /// as the current instance.
  ///
  /// Returns a new instance of [LoginState].
  LoginState copyWith({Authstatus? status,bool? isLogin}) {
    return LoginState(status: status ?? this.status,isLogin: isLogin??this.isLogin);
  }
}

/// login initial state
class LoginInitial extends LoginState {}

/// login loading state
class LoginLoading extends LoginState {
  /// constructor
  const LoginLoading({super.isLogin});
}

/// login success state
class LoginSuccess extends LoginState {}

/// login failure state
class LoginFailure extends LoginState {}
