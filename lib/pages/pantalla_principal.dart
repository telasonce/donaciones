import 'package:donaciones/pages/agregar_donacion.dart';
import 'package:donaciones/pages/consultar_donaciones.dart';
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AgregarDonacion(),
    ConsultarDonaciones(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donaciones',
        ),
      ),
      drawer: Menu(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Agregar',
            icon: Icon(
              Icons.create_new_folder_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Consultar',
            icon: Icon(
              Icons.folder_special,
            ),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
