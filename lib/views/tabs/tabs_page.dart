import 'package:flutter/material.dart';
import 'package:nail_artists_hub/views/register/register_page.dart';
import 'package:nail_artists_hub/views/sign_in/sign_in_page.dart';
import 'package:nail_artists_hub/views/nail_salons/nail_salons_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() {
    return _TabsPageState();
  }
}

class _TabsPageState extends State<TabsPage> {
  int _selectedPageIndex = 0;
  bool _showSignIn = true;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void toggleView() {
    setState(() {
      _showSignIn = !_showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const NailSalonPage();
    var activePageTitle = 'Nail Artists Hub';

    if (_selectedPageIndex == 1) {
      if (_showSignIn) {
        activePage = SignInPage(toggleView: toggleView);
        activePageTitle = 'Sign In';
      } else {
        activePage = RegisterPage(toggleView: toggleView);
        activePageTitle = 'Register';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profiel',
          ),
        ],
      ),
    );
  }
}
