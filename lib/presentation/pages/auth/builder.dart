
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enums/authStatus.dart';
import '../../bloc/login/bloc.dart';
import '../../bloc/login/event.dart';
import '../../bloc/login/state.dart';
import '../Landing/page.dart';
import '../dashBoard/page.dart';
import 'login/page.dart';


///Basement page to build the ui based on login credentials
class AuthBuilder extends StatefulWidget {
  ///No child required
  const AuthBuilder({super.key});
  @override
  _HomeBuilderState createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<AuthBuilder> with AutomaticKeepAliveClientMixin {
  Authstatus authstatus = Authstatus.checking;

  @override
  void initState() {
    checkFn();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    switch (authstatus) {
      case Authstatus.checking:
        return const LoadingPage(status: 'Checking Authendication...');
      case Authstatus.authenticated:
        return const DashBoardPage();
      case Authstatus.unAuthenticated:
        return const LoginPage();
    }
  }

  void checkFn() {
    final LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
    _bloc.stream.listen((LoginState _as) {
      if (mounted) {
        setState(() => authstatus = _as.status);
      }
    });
    _bloc.add(CheckAuthEvent());
  }
}
