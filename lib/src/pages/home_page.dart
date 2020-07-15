import 'package:PreferenciasUsuario/src/shared_preferences/shared_preferences.dart';
import 'package:PreferenciasUsuario/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      backgroundColor: (prefs.darkTheme) ? Colors.grey : Colors.white,
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.darkTheme) ? Colors.black : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Tema Oscuro: ${prefs.darkTheme}'),
          Divider(),
          Text('Género: ${prefs.genre}'),
          Divider(),
          Text('Nombre de Usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}