import 'package:shared_preferences/shared_preferences.dart';

class PreferencesAccountCreate {
  static late SharedPreferences _prefs;

  static String _nombre = '';
  static String _email = '';

  static int _genero = 1;
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

  //Genero
  static int get genero {
    return _prefs.getInt('genero') ?? _genero;
  }

  static set genero(int genero) {
    _genero = genero;
    _prefs.setInt('genero', genero);
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
