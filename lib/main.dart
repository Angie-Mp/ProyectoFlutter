import 'package:flutter/material.dart';
import 'package:flutter_app/prefereces/preferences.dart';
import 'package:flutter_app/provider/themeprovider.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode: Preferences.theme),
    )
  ], child: MyApp())

      //MyApp()

      );
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      /* ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),*/
      onGenerateRoute: MyRoutes.generateRoute,
      // home: const HomeScreen(),
    );
  }
}
