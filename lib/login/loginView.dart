import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routesApp.dart';
import 'package:flutter_app/routes/routeView.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _ispassword = true;
  void _viewPassword() {
    setState(() {
      _ispassword = !_ispassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_9ycwmgb9.json'),
                Form(
                    key: loginProvider.formkey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Color(0xFFFF6C44)),
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _buildDecoration(
                              hintText: 'Ingrese Correo',
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFFFF6C44),
                              ),
                            ),
                            onChanged: (value) => loginProvider.email = value,
                            validator: (value) {
                              String caracteres =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                              RegExp regExp = RegExp(caracteres);

                              return regExp.hasMatch(value ?? '')
                                  ? null
                                  : 'Ingrese un correo valido';
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Color(0xFFFF6C44)),
                            autocorrect: false,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: _buildDecoration(
                              hintText: 'Ingrese Contraseña',
                              suffixIcon: InkWell(
                                onTap: _viewPassword,
                                child: Icon(
                                  _ispassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xFFFF6C44),
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.key_outlined,
                                color: Color(0xFFFF6C44),
                              ),
                            ),
                            onChanged: (value) =>
                                loginProvider.password = value,
                            validator: (value) {
                              return (value != null && value.length >= 8)
                                  ? null
                                  : 'Debe tener minimo 8 caracteres';
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 180,
                            height: 45,
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                disabledColor: Color(0xFFFF6C44),
                                elevation: 5,
                                color: Color(0xFFFF6C44),
                                onPressed: loginProvider.isLoading
                                    ? null
                                    : () async {
                                        FocusScope.of(context).unfocus();
                                        if (!loginProvider.isValidForm())
                                          return;
                                        loginProvider.isLoading = true;
                                        await Future.delayed(
                                            Duration(seconds: 2));
                                        loginProvider.isLoading = false;

                                        Navigator.pushReplacementNamed(
                                            context, MyRoutes.routeHOME);
                                      },
                                child: (loginProvider.isLoading)
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        'Iniciar Sesion',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, MyRoutes.routeCREATEACCOUNT);
                              },
                              child: const Text(
                                'Crear cuenta',
                                style: TextStyle(color: Color(0xFFFF6C44)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration _buildDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Color(0xFFFF6C44)),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Color(0xFFFF6C44)),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Color(0xFFFF6C44)),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Color(0xFFFF6C44)),
      borderRadius: BorderRadius.circular(15),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(18),
  );
}
