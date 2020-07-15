
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool   _darkTheme;
  // int    _genre;
  // String _nombre;

  get genre {
    return _prefs.getInt('genre') ?? 1;
  }

  set genre (int value) {
    _prefs.setInt('genre', value);
  }

  get darkTheme {
    return _prefs.getBool('theme') ?? false;
  }

  set darkTheme (bool value) {
    _prefs.setBool('theme', value);
  }

  get nombreUsuario {
    return _prefs.getString('user') ?? '';
  }

  set nombreUsuario (String value) {
    _prefs.setString('user', value);
  }

  get ultimaPagina {
    return _prefs.getString('page') ?? 'home';
  }

  set ultimaPagina (String value) {
    _prefs.setString('page', value);
  }
}