import 'package:flutter/material.dart';
import 'package:flutter_app/home/perfil/provider/darkMood.dart';
import 'package:flutter_app/routes/routeView.dart';
import 'package:flutter_app/routes/routesApp.dart';
import 'package:flutter_app/home/perfil/provider/darkMood.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesAccountCreate.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => DarkMood(isDarkMode: PreferencesAccountCreate.theme)),
    ChangeNotifierProvider(
      create: (_) => LoginProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eco-food',
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.routeSPLASHLOGIN,
    );
  }
}
