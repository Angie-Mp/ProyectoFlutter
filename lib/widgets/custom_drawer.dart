import 'package:flutter/material.dart';
import 'package:flutter_app/screens/index.dart';

import '../routes/route.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2022/11/11/13/00/clouds-7584944_960_720.jpg'))),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Hola Mundo',
                style: TextStyle(
                    fontSize: 32, color: Color.fromARGB(255, 0, 52, 94)),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.routeHOME);
              /*  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );*/
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.routeAJUSTE);

              /*  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfigScreen()),
              );*/
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfíl'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.routePERFIL);

              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilScreen()),
              );
              */
            },
          ),
        ],
      ),
    );
  }
}
