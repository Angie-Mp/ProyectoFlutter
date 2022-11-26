import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routesApp.dart';

class MyRoutes {
  static const String routeLOGIN = '/login';
  static const String routeSPLASHLOGIN = '/splash';
  static const String routeCREATEACCOUNT = '/createAccount';
  static const String routeHOME = '/home';
  static const String routeCART = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginView());

      case ('/splash'):
        return MaterialPageRoute(builder: (_) => SplashLogin());

      case ('/createAccount'):
        return MaterialPageRoute(builder: (_) => const CreateAccount());

      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomeView());
      case ('/cart'):
        return MaterialPageRoute(builder: (_) => const MyCartView());

      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}