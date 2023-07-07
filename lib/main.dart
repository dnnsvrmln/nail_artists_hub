import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nail_artists_hub/shared/constants.dart';

import 'firebase_options.dart';
import 'package:nail_artists_hub/views/tabs/tabs_page.dart';

Future<void> main() async {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: appBackgroundColor,
      ),
      // home: const NailSalonPage(),
      home: const TabsPage(),
    );
  }
}
