import 'package:flutter/material.dart';
import 'package:nail_artists_hub/commons/logger.dart';
import 'package:nail_artists_hub/services/auth_service.dart';

class Body extends StatefulWidget {
  final Function toggleView;

  const Body({super.key, required this.toggleView});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final commonsLogger = CommonsLogger(loggerClass: 'RegisterPage');
    final authService = AuthService();

    var email = '';
    var password = '';

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 75,
            ),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      dynamic result = await authService.signInAnonymous();

                      if (result == null) {
                        commonsLogger.logError('Error signin in');
                      }

                      commonsLogger.logInfo(result.toString());
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      widget.toggleView();
                    },
                    child: const Text('Already registered? Sign in here!'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
