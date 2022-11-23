import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routeView.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/routes/routesApp.dart';
import 'package:lottie/lottie.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final nombreController =
      TextEditingController(text: PreferencesAccountCreate.nombre);
  final emailController =
      TextEditingController(text: PreferencesAccountCreate.email);

  @override
  Widget build(BuildContext context) {
    save() {
      PreferencesAccountCreate.nombre = nombreController.text;
      PreferencesAccountCreate.email = emailController.text;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear Cuenta',
          style: TextStyle(color: Color(0xFFFF6C44)),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      //  drawer: const CustomDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_hsis9re9.json'),
                //

                CustomTextFieldWidget(
                  controller: nombreController,
                  keyboardType: TextInputType.name,
                  hintText: 'Nombre',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Color(0xFFFF6C44),
                  ),
                ),
                //
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  controller: emailController,
                  keyboardType: TextInputType.name,
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.local_post_office,
                    color: Color(0xFFFF6C44),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextFieldWidget(
                  keyboardType: TextInputType.name,
                  hintText: 'Contraseña',
                  prefixIcon: Icon(
                    Icons.password_outlined,
                    color: Color(0xFFFF6C44),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  width: 180,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Color(0xFFFF6C44),
                      child: const Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        save();
                        setState(() {});
                        Navigator.pushReplacementNamed(
                            context, MyRoutes.routeLOGIN);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
