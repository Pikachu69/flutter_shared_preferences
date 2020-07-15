import 'package:PreferenciasUsuario/src/shared_preferences/shared_preferences.dart';
import 'package:PreferenciasUsuario/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkTheme;
  int _genre;

  TextEditingController _textController;

  final prefs = new UserPreferences();
  
  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
    _genre = prefs.genre;
    _darkTheme = prefs.darkTheme;
  }

  _setSelectedRadio(int valor) {
    prefs.genre = valor;
    _genre = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (prefs.darkTheme) ? Colors.grey : Colors.white,
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.darkTheme) ? Colors.black : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _darkTheme, 
            title: Text('Tema Oscuro'),
            onChanged: (value) {
              setState(() {
                prefs.darkTheme = value;
                _darkTheme = value;
              });
            }
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genre, 
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genre, 
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre del usuario',
              ),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      )
    );
  }
}