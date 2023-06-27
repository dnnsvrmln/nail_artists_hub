import 'package:flutter/material.dart';

import 'package:nail_artists_hub/views/register/components/body.dart';

class RegisterPage extends StatelessWidget {
  final Function toggleView;

  const RegisterPage({super.key, required this.toggleView});

  @override
  Widget build(BuildContext context) {
    return Body(toggleView: toggleView);
  }
}
