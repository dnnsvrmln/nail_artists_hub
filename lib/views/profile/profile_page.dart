import 'package:flutter/material.dart';
import 'package:nail_artists_hub/shared/base_app_bar.dart';
import 'package:nail_artists_hub/shared/constants.dart';
import 'package:nail_artists_hub/views/profile/components/body.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  String nailSalonId;

  ProfilePage({super.key, required this.nailSalonId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'Hallo name'),
      body: Body(nailSalonId: widget.nailSalonId),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appBackgroundColor,
        selectedItemColor: appTextgroundColor,
        unselectedItemColor: appTextgroundColor,
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
