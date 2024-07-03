import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Extensions/Extensions.dart';
import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../bloc/login/bloc.dart';
import '../../../bloc/login/event.dart';
import '../../../bloc/login/state.dart';

/// login form containing email, password, and login button
class LoginForm extends StatefulWidget {
  /// constructor
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? name;
  String? email;
  String? password;
  bool rememberMe = false;
  bool isValid(bool isLogin) {
    if ((email?.isNotEmpty ?? false) && (password?.isNotEmpty ?? false)) {
      if (email!.isValidEmail) {
        if (isLogin) {
          return true;
        } else {
          if (name?.isNotEmpty ?? false) {
            return true;
          }
        }
      }
    }
    return false;
  }

  // @override
  // void initState() {
  //   if (Widgets.debugging) {
  //     email = 'john@mail.com';
  //     password = 'changeme';
  //     setState(() {});
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          key: Key('${state.isLogin}'),
          children: [
            if (!state.isLogin) _nameTxtField(),
            _emailOrMobNoTxtField(),
            _passwordTxtField(),
            _submitButton(),
          ]
              .map((e) => Column(
                    children: [e, SizeConfig.verticalSpace()],
                  ))
              .toList(),
        );
      },
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSuccess) {
          _clearFields();
        }
      },
    );
  }

  Widget _nameTxtField() {
    return TxtField(
        text: name,
        labelText: 'Name',
        hintText: 'Enter Name',
        onChanged: (val) {
          setState(() {
            name = val;
          });
        });
  }

  // Returns a TxtField widget for entering email or mobile number text, with an onChanged function to update the email state.
  Widget _emailOrMobNoTxtField() {
    return TxtField(
        text: email,
        labelText: 'Email',
        hintText: 'Enter Email',
        onChanged: (val) {
          setState(() {
            email = val;
          });
        });
  }

  /// Returns a widget that displays a text field for entering a password.
  ///
  /// The widget is a [TxtField] widget with the provided [text] as the initial value.
  /// The [hintText] is set to 'Enter Password'.
  /// The [onChanged] callback updates the [password] state with the new value.
  ///
  /// Returns:
  ///   A [TxtField] widget for entering a password.
  Widget _passwordTxtField() {
    return TxtField(
        password: true,
        text: password,
        labelText: 'Password',
        hintText: 'Enter Password',
        onChanged: (val) {
          setState(() {
            password = val;
          });
        });
  }

  // Widget function that returns a BlocConsumer widget listening to LoginBloc and LoginState.
  Widget _submitButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return Button.submit(
          isValid: isValid(state.isLogin),
          submitFn: state.isLogin ? _onLogin : _onRegister,
          showErrorFn: () {
            _invalidDetails(state.isLogin);
          },
        );
      },
      listener: (BuildContext context, LoginState state) {
        if (state is LoginFailure) {
          Widgets.showToast('Invalid ID Password');
        } else if (state is LoginSuccess) {
          // Navigate to the next screen
        }
      },
    );
  }

  void _onLogin() {
    // Handles the submission process by checking if email and password are not empty, then triggers the LoginButtonPressed event with the provided email and password.
    context.read<LoginBloc>().add(LoginButtonPressed(
          email: email!,
          password: password!,
        ));
  }

  void _onRegister() {
    // Handles the registration process by checking if email and password are not empty, then triggers the RegisterButtonPressed event with the provided email, password, and name.
    context.read<LoginBloc>().add(
        RegisterButtonPressed(email: email!, password: password!, name: name));
  }

  /// Updates the [message] based on the validity of the [email] and [password].
  void _invalidDetails(bool isLogin) {
    String message = 'Please Enter email';
    if (email?.isEmpty ?? true) {
      message = 'Please Enter email';
    } else if (!(email?.isValidEmail ?? false)) {
      message = 'Please Enter valid email';
    } else if (password?.isEmpty ?? true) {
      message = 'Please Enter password';
    }
    if (!isLogin && (name?.isEmpty ?? true)) {
      message = 'Please Enter name';
    }
    setState(() {});

    if (message.isNotEmpty) {
      Widgets.showToast(message);
    }
  }

  /// Clears the fields by setting the values of `name`, `email`, and `password` to empty strings.
  ///
  /// This function is used to reset the form fields after submission or cancellation.
  /// It updates the state of the widget and triggers a rebuild.
  void _clearFields() {
    setState(() {
      name = '';
      email = '';
      password = '';
    });
    print('working');
  }
}
