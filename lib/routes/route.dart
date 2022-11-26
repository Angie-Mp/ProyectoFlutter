import 'package:flutter/material.dart';
import 'package:flutter_app/screens/index.dart';

class MyRoutes {
  static const String routeHOME = '/home';
  static const String routePERFIL = '/perfil';
  static const String routeCART = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomeView());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const PerfilView());
      case ('/cart'):
        return MaterialPageRoute(builder: (_) => const MyCartView());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
