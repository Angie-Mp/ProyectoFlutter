import 'package:flutter/material.dart';
import 'package:flutter_app/home/perfil/customTextFieldPerfil.dart';
import 'package:flutter_app/utils/font_styles.dart';
import 'package:flutter_app/routes/routesApp.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({Key? key}) : super(key: key);
  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final nombreController =
      TextEditingController(text: PreferencesAccountCreate.nombre);
  final emailController =
      TextEditingController(text: PreferencesAccountCreate.email);
  final numeroController =
      TextEditingController(text: PreferencesAccountCreate.numero);

  static const Color primaryColor = const Color.fromARGB(255, 0, 23, 63);
  static const Color secondColor = const Color(0xFFFF6C44);

  @override
  Widget build(BuildContext context) {
    save() {
      PreferencesAccountCreate.nombre = nombreController.text;
      PreferencesAccountCreate.email = emailController.text;
      PreferencesAccountCreate.numero = numeroController.text;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        toolbarHeight: kToolbarHeight * 1.25,
        title: const Text('Perfil'),
        titleTextStyle: FontStyles.title.copyWith(
          color: Colors.white,
        ),
        leading: Icon(Icons.add, color: Color(0xFFFF6C44)),
        backgroundColor: const Color(0xFFFF6C44),
      ),
      /*AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Perfil',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.arrow_back_sharp,
              color: primaryColor,
            ),
          ),
        ),
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              children: [
                //Espacio
                const SizedBox(height: 20.0),

                //Imagen e icono de camara
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2022/11/11/09/26/cat-7584624_960_720.jpg'),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 1,
                      left: 1,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondColor,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50.0),
                //Texto
                const Text(
                  'Mi Perfil',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 40.0),

                //Caja de texto nombre completo
                CustomTextFieldPerfil(
                  controller: nombreController,
                  keyboardType: TextInputType.name,
                  hintText: '${PreferencesAccountCreate.nombre}',
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 15.0),
                //correo
                CustomTextFieldPerfil(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: '${PreferencesAccountCreate.email}',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 15.0),
                //numero
                CustomTextFieldPerfil(
                  controller: numeroController,
                  keyboardType: TextInputType.phone,
                  hintText: '${PreferencesAccountCreate.numero}',
                  prefixIcon: const Icon(
                    Icons.phone_android_rounded,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 40.0),
                //Botón actulizar
                InkWell(
                  onTap: () {
                    save();
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: secondColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.update, color: Colors.white),
                        SizedBox(width: 5.0),
                        Text(
                          'Actualizar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
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
 */

/////////
/*
import 'package:flutter/material.dart';

import 'package:flutter_app/routes/routesApp.dart';
import 'package:flutter_app/utils/font_styles.dart';

class PerfilView extends StatelessWidget {
  const PerfilView({Key? key}) : super(key: key);

  static const Color primaryColor = const Color(0xFFFF6C44);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        toolbarHeight: kToolbarHeight * 1.25,
        title: const Text('Perfil'),
        titleTextStyle: FontStyles.title.copyWith(
          color: Colors.white,
        ),
        leading: Icon(Icons.add, color: Color(0xFFFF6C44)),
        backgroundColor: const Color(0xFFFF6C44),
      ),
      /*AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Perfil',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.arrow_back_sharp,
              color: primaryColor,
            ),
          ),
        ),
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              children: [
                //Espacio
                const SizedBox(height: 20.0),

                //Imagen e icono de camara
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2022/11/11/09/26/cat-7584624_960_720.jpg'),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 1,
                      left: 1,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),

                //Espacio
                const SizedBox(height: 50.0),

                //Texto
                const Text(
                  'Mi Perfil',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                //Espacio
                const SizedBox(height: 40.0),

                //Caja de texto nombre completo
                TextFormField(
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,

                    hintText: '${PreferencesAccountCreate.nombre}',
                    //  Text('Mi Nombre es: ${PreferencesAccountCreate.nombre}'),
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: primaryColor,
                    ),
                    contentPadding: const EdgeInsets.all(20.0),
                  ),
                ),

                //Espacio
                const SizedBox(height: 15.0),

                //Caja de texto correo electrónico
                TextFormField(
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Correo electrónico',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: primaryColor,
                    ),
                    contentPadding: const EdgeInsets.all(20.0),
                  ),
                ),

                //Espacio
                const SizedBox(height: 15.0),

                //Caja de texto numero celular
                TextFormField(
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Número teléfono',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.phone_android_rounded,
                      color: primaryColor,
                    ),
                    contentPadding: const EdgeInsets.all(20.0),
                  ),
                ),

                //Espacio
                const SizedBox(height: 40.0),

                //Botón actulizar
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.update, color: Colors.white),
                      SizedBox(width: 5.0),
                      Text(
                        'Actualizar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */