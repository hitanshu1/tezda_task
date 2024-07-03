import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/Widgets/richString.dart';

import '../../../bloc/login/bloc.dart';
import '../../../bloc/login/event.dart';
import '../../../bloc/login/state.dart';
import 'form.dart';

/// login page
class LoginPage extends StatelessWidget {
  ///constructor
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      print(state.isLogin);

      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: SizeConfig.pagePadding,
            child: AppLoadingWidget(
              isLoading: state is LoginLoading,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _appName(),
                    SizeConfig.verticalSpace(height: 60.sp),
                    _subtile(),
                    SizeConfig.verticalSpace(height: 40.sp),
                    const LoginForm(),
                    SizeConfig.verticalSpaceMedium(),
                    SizeConfig.verticalSpace(),
                    if (state.isLogin) _signUp() else _goToLogin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Returns a widget that displays the app name.
  ///
  /// This widget is a [Widgets.heading] widget that displays the app name obtained from the [AppInfo.appName] constant.
  ///
  /// Returns:
  ///   A [Widgets.heading] widget displaying the app name.
  Widget _appName() {
    return Widgets.heading(text: AppInfo.appName);
  }

  Widget _subtile() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Widgets.heading(
          text: state.isLogin ? 'Hi, Welcome Back!' : 'Register Here',
          fontSize: 20.sp,
          color: Colors.black87);
    });
  }

  /// Returns a widget that displays a sign up option.
  ///
  /// The widget is a [RichTxt] widget that displays a sign up option with a text alignment of end.
  /// It contains two [RichString] widgets:
  /// - The first [RichString] displays the text "Don't have an account?" with a black color.
  /// - The second [RichString] displays the text "Sign Up" with a blue color, bold font weight, and an onTap callback.
  ///
  /// Returns:
  ///   A [RichTxt] widget displaying the sign up option.
  Widget _signUp() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return RichTxt(textAlign: TextAlign.center, richStrings: [
        const RichString("Don't have an account? \n", color: Colors.black),
        RichString('Sign Up', color: Colors.blue, fontWeight: FontWeight.bold,
            onTap: () {
          context
              .read<LoginBloc>()
              .add(const ChangeLoginViewEvent(isLogin: false));
        })
      ]);
    });
  }

  // Returns a widget that displays the login option.
  //
  // The widget is a [RichTxt] widget that displays a login option with a text alignment of center.
  // It contains two [RichString] widgets:
  // - The first [RichString] displays the text "Already have an account?" with a black color.
  // - The second [RichString] displays the text "Login" with a blue color, bold font weight, and an onTap callback that triggers a ChangeViewEvent with isLogin set to true.
  //
  // Returns:
  //   A [RichTxt] widget displaying the login option.
  Widget _goToLogin() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return RichTxt(textAlign: TextAlign.center, richStrings: [
        const RichString('Already have an account? \n', color: Colors.black),
        RichString('Login', color: Colors.blue, fontWeight: FontWeight.bold,
            onTap: () {
          context
              .read<LoginBloc>()
              .add(const ChangeLoginViewEvent(isLogin: true));
        })
      ]);
    });
  }
}
