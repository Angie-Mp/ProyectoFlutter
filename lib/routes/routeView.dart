import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routesApp.dart';

class MyRoutes {
  static const String routeLOGIN = '/login';
  static const String routeSPLASHLOGIN = '/splash';
  static const String routeCREATEACCOUNT = '/createAccount';
  static const String routeHOME = '/home';
  static const String routeSTORES = '/stores';
  static const String routePERFIL = '/perfil';

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
      case ('/stores'):
        return MaterialPageRoute(builder: (_) => const StoreMapsView());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const PerfilView());

      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
