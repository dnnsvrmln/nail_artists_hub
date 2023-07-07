import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nail_artists_hub/shared/constants.dart';
import 'package:nail_artists_hub/shared/loading_spinner.dart';

import 'package:nail_artists_hub/shared/logger.dart';
import 'package:nail_artists_hub/services/auth_service.dart';
import 'package:nail_artists_hub/views/profile/profile_page.dart';

class Body extends StatefulWidget {
  final Function toggleView;

  const Body({super.key, required this.toggleView});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static final _logger = Logger(loggerClass: 'SignInPage');

  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  var _isLoading = false;
  var _email = '';
  var _password = '';

  final _emailValidator = MultiValidator(
    [
      RequiredValidator(errorText: '* Verplicht'),
      EmailValidator(errorText: 'Vul een geldig emailadres in'),
    ],
  );

  final _passwordValidator = MultiValidator(
    [
      RequiredValidator(errorText: "* Verplicht"),
      MinLengthValidator(8,
          errorText: "Wachtwoord moet meer dan 8 karakters lang zijn"),
      MaxLengthValidator(22,
          errorText: "Wachtwoord mag niet meer dan 22 karakters lang zijn")
    ],
  );

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _showSnackbarSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingSpinner()
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 50,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => _email = value,
                          validator: _emailValidator,
                          style: const TextStyle(color: appAccentColor),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: appAccentColor),
                            ),
                            fillColor: appTextgroundColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: appSubTextgroundColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: appTextgroundColor,
                              ),
                            ),
                            labelText: 'Emailadres',
                            labelStyle: const TextStyle(color: appAccentColor),
                            hintText: 'Vul je emailadres in',
                            hintStyle: const TextStyle(color: appAccentColor),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          onChanged: (value) => _password = value,
                          validator: _passwordValidator,
                          style: const TextStyle(color: appAccentColor),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: appAccentColor),
                            ),
                            fillColor: appTextgroundColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: appSubTextgroundColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: appTextgroundColor,
                              ),
                            ),
                            labelText: 'Wachtwoord',
                            labelStyle: const TextStyle(color: appAccentColor),
                            hintText: 'Vul je wachtwoord in',
                            hintStyle: const TextStyle(color: appAccentColor),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 20,
                              ),
                              backgroundColor: appAccentColor,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

                                dynamic result = await _authService
                                    .signInWithEmailAndPassWord(
                                        _email, _password);

                                if (result != null) {
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      nailSalonId: result.user.uid,
                                    ),
                                  ));

                                  _showSnackbarSuccess('Login is gelukt!');
                                } else {
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  _logger.logError('Login failed');
                                  _showSnackbar('Login is mislukt!');
                                }
                              }
                            },
                            child: const Text('Inloggen'),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: const Text(
                            'Nog niet geregistreerd? Registreer hier!',
                            style: TextStyle(color: appSubTextgroundColor),
                          ),
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
