import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/fancyBottomNavigator.dart';
import '../models/auth.dart';
import 'categories_screen.dart';
import 'config_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<String> _titles = [
    'Lista de Categorias',
    'Configurações',
  ];

  final List<Widget> _screens = [CategoriesScreen(), ConfigScreen()];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(auth.email ?? _titles[_selectedScreenIndex]),
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: ""),
          // TabData(iconData: Icons.search, title: ""),
          TabData(iconData: Icons.settings, title: "")
        ],
        onTabChangedListener: (position) {
          _selectScreen(position);
        },
      ),
    );
  }
}
