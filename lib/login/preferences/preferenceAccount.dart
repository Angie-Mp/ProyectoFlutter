import 'package:shared_preferences/shared_preferences.dart';

class PreferencesAccountCreate {
  static late SharedPreferences _prefs;

  static String _nombre = '';
  static String _email = '';
  static String _numero = '';

  static bool _theme = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GET & SET
  //Nombre
  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String nombre) {
    _nombre = nombre;
    _prefs.setString('nombre', nombre);
  }

  //Apellido
  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String email) {
    _email = email;
    _prefs.setString('email', email);
  }

  //numero
  static String get numero {
    return _prefs.getString('numero') ?? _numero;
  }

  static set numero(String numero) {
    _numero = numero;
    _prefs.setString('numero', numero);
  }

//Theme
  static bool get theme {
    return _prefs.getBool('theme') ?? _theme;
  }

  static set theme(bool theme) {
    _theme = theme;
    _prefs.setBool('theme', theme);
  }
}
