import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routeView.dart';
import 'package:flutter_app/routes/routesApp.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesAccountCreate.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LoginProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Food',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
