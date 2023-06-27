import 'package:flutter/material.dart';

import 'package:nail_artists_hub/views/sign_in/components/body.dart';

class SignInPage extends StatelessWidget {
  final Function toggleView;

  const SignInPage({super.key, required this.toggleView});

  @override
  Widget build(BuildContext context) {
    return Body(toggleView: toggleView);
  }
}
