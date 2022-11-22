import 'package:flutter/material.dart';
import 'package:flutter_app/prefereces/preferences.dart';
import 'package:flutter_app/provider/themeprovider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  // const AjusteScreen({super.key});
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        //
        actions: [
          Switch.adaptive(
            value: Preferences.theme,
            onChanged: (value) {
              Preferences.theme = value;
              final themeP = Provider.of<ThemeProvider>(context, listen: false);
              value ? themeP.setOscuro() : themeP.setClaro();
              setState(() {});
            },
          )
        ],
      ),
      drawer: const CustomDrawerWidget(),
      body: const Center(
        child: Text(
          'BIENVENIDO',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
