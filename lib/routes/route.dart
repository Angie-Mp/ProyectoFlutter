import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/index.dart';

class MyRoutes {
  static const String routeHOME = '/home';
  static const String routeAJUSTE = '/ajuste';
  static const String routePERFIL = '/perfil';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case ('/ajuste'):
        return MaterialPageRoute(builder: (_) => const ConfigScreen());

      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const PerfilScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
