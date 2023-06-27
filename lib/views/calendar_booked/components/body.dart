import 'dart:async';
import 'package:flutter/material.dart';

import 'package:nail_artists_hub/views/tabs/tabs_page.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TabsPage(),
      ));
    });

    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Bedankt voor de boeking!'),
          SizedBox(height: 16),
          Text('Je wordt over vijf seconden doorverwezen!'),
        ],
      ),
    );
  }
}
