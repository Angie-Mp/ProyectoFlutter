import 'package:flutter/material.dart';

import 'package:flutter_app/routes/routesApp.dart';

class PerfilView extends StatelessWidget {
  const PerfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Mi Nombre es: ${PreferencesAccountCreate.nombre}'),
            Text('Mi Apellido es: ${PreferencesAccountCreate.email}'),
          ],
        ),
      ),
    );
  }
}
