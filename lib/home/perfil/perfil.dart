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
