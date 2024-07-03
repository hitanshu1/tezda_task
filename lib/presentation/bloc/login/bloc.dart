import 'package:bloc/bloc.dart';
import '../../../Widgets/Widgets.dart';
import '../../../core/constants/enums/authStatus.dart';

import '../../../core/utils/getStorage.dart';
import '../../../data/models/firebase/authCredentials.dart';
import '../../../domain/repositories/auth.dart';
import '../appUser/bloc.dart';
import 'event.dart';
import 'state.dart';

/// login bloc manange state and event
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// login repository
  final AuthRepository repository;

  /// login bloc constructor
  LoginBloc(this.repository) : super(LoginInitial()) {
    on<CheckAuthEvent>(_checkAuthFn);
    on<LoginButtonPressed>(_onLogin);
    on<RegisterButtonPressed>(_onRegister);
    on<LogoutEvent>(_logoutFn);
    on<ChangeLoginViewEvent>(_changeView);
  }

  Future<void> _checkAuthFn(
      CheckAuthEvent event, Emitter<LoginState> emit) async {
    final AppUser user = AppGetXStorage.instance.getUser;
    final Authstatus status = user == AppUser.notFound
        ? Authstatus.unAuthenticated
        : Authstatus.authenticated;
    emit(state.copyWith(status: status));
  }

  Future<void> _onLogin(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(const LoginLoading());
    final response = await repository.login(
        AppAuthCredentials(email: event.email, password: event.password));

    print(response.responseString);
    if (response.isSuccess) {
      final AppUser appUser = AppUser.fromJson(response.json);
      AppGetXStorage.instance.setUserProfile(appUser);
      emit(LoginSuccess());
      Widgets.showToast('Login Successfully');
      emit(state.copyWith(status: Authstatus.authenticated));
    } else {
      emit(LoginFailure());
    }
  }

  Future<void> _onRegister(
      RegisterButtonPressed event, Emitter<LoginState> emit) async {
     emit(const LoginLoading(isLogin: false));

    final response = await repository.register(AppAuthCredentials(
        email: event.email, password: event.password, name: event.name));

    print(response.responseString);
    if (response.isSuccess) {
      Widgets.showToast('Register Successfully');
      emit(LoginSuccess());
      emit(state.copyWith(isLogin: true));
    }
  }

  Future<void> _logoutFn(LogoutEvent event, Emitter<LoginState> emit) async {
    AppGetXStorage.instance.logout();
    emit(LoginInitial());
    emit(state.copyWith(status: Authstatus.unAuthenticated));
  }

  /// change login view
  void _changeView(ChangeLoginViewEvent event, Emitter<LoginState> emit) {
    print('calling====${event.isLogin}');
    emit(LoginInitial());
    emit(state.copyWith(isLogin: event.isLogin));
  }
}
