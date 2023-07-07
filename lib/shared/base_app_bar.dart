import 'package:flutter/material.dart';
import 'package:nail_artists_hub/shared/constants.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BaseAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: appTextgroundColor),
      ),
      elevation: 0,
      backgroundColor: appBackgroundColor,
      iconTheme: const IconThemeData(color: appAccentColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
