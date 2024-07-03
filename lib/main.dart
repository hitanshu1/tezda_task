
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';

import 'core/utils/getStorage.dart';
import 'core/utils/navigationService.dart';
import 'domain/repositories/auth.dart';
import 'domain/repositories/product.dart';
import 'domain/repositories/userRepository.dart';
import 'presentation/bloc/appUser/bloc.dart';
import 'presentation/bloc/dashboard/bloc.dart';
import 'presentation/bloc/login/bloc.dart';
import 'presentation/bloc/product/bloc.dart';
import 'presentation/bloc/profile/bloc.dart';
import 'presentation/bloc/wishList/bloc.dart';
import 'routes/appRoutes.dart';
import 'theme.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

/// Main App
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(AuthRepository.instance))  ,
        BlocProvider<AppUserBloc>(create: (BuildContext context) => AppUserBloc()),
          BlocProvider(create: (context) => DashBoardBloc()),
        BlocProvider(create: (context)=>ProductBloc(ProductRepository.instance)),
         BlocProvider<ProfileBloc>(create: (BuildContext context) => ProfileBloc(repository: UserRepository.instance)),
   BlocProvider(
          create: (context) => WishlistBloc(appGetXStorage: AppGetXStorage.instance),
        ),
             ],
        child: ScreenUtilInit(
          designSize: MediaQuery.sizeOf(context),
          builder: (context,child) {
            return  MaterialApp(
              navigatorKey: NavigatorService.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: theme(false),
              themeMode: ThemeMode.light,
              onGenerateRoute: AppRoutes.generateRoute,
              initialRoute: AppRoutes.initialRoute,
        
            );
          }
        ),
      ),
    );
  }
}
