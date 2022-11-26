import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routeView.dart';
import 'package:flutter_app/routes/routesApp.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

//

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Food',
      home: SplashLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashLogin extends StatefulWidget {
  @override
  _SplashLoginState createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginView())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Lottie.network(
          'https://assets10.lottiefiles.com/packages/lf20_tll0j4bb.json'),
      /*Image.asset(
          'assets/logoEcoFood.png',
        )*/
    );
  }
}
