
import 'package:flutter/material.dart';
import '../presentation/pages/auth/builder.dart';
import '../presentation/pages/productDetails/page.dart';
import '../presentation/pages/updateProfile/page.dart';

/// app routes
class AppRoutes {
  AppRoutes._();
/// initial route
  static const String initialRoute = '/';
  /// product details page
  static const String productDetails = '/productDetails';
/// update profile
  static const String updateProfile = '/updateProfile';

  /// Generates a route based on the given [RouteSettings].
  ///
  /// The [settings] parameter contains the name of the route to be generated.
  /// The function returns a [Route] object that represents the generated route.
  ///
  /// The function uses a switch statement to determine the type of route to be generated based on the [settings.name].
  /// If the [settings.name] is equal to [initialRoute], it returns a [MaterialPageRoute] that builds a [const AuthBuilder].
   /// If the [settings.name] does not match any of the above cases, it returns a [MaterialPageRoute] that builds a [Scaffold] with a [Center] widget displaying the text 'Unknown route: ${settings.name}'.
  ///
  /// Parameters:
  /// - `settings` (RouteSettings): The settings for the route to be generated.
  ///
  /// Returns:
  /// - `Route<dynamic>`: The generated route.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => const AuthBuilder(),
        );
      case productDetails:
        // final int args = settings.arguments as int; // Assuming the argument is a int
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(id: settings.arguments! as int,)
        );
      case updateProfile:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfilePage()
           
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Unknown route: ${settings.name}')),
          ),
        );
    }
  }
}
