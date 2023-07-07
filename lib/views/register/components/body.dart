import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nail_artists_hub/shared/constants.dart';
import 'package:nail_artists_hub/shared/loading_spinner.dart';
import 'package:nail_artists_hub/shared/logger.dart';
import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/services/auth_service.dart';
import 'package:nail_artists_hub/services/firebase_service.dart';

class Body extends StatefulWidget {
  final Function toggleView;

  const Body({super.key, required this.toggleView});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static final _logger = Logger(loggerClass: 'RegisterPage');
  static final _now = DateTime.now();

  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  var _isLoading = false;
  var _companyName = '';
  var _firstName = '';
  var _insertion = '';
  var _lastName = '';
  var _phoneNumber = '';
  var _streetName = '';
  var _houseNumber = 0;
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
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: appSubTextgroundColor,
      ),
    );
  }

  void _showSnackbarSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: appAccentColor,
      ),
    );
  }

  void _registerNailSalon(
    String uid,
    String companyName,
    String firstName,
    String insertion,
    String lastName,
    String email,
    String phoneNumber,
    String streetName,
    int houseNumber,
  ) {
    var nailSalon = NailSalon(
      id: uid,
      companyName: companyName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      streetName: streetName,
      houseNumber: houseNumber,
      workdayStartTime: DateTime(_now.year, _now.month, _now.day, 8, 30),
      workdayEndTime: DateTime(_now.year, _now.month, _now.day, 17, 30),
      lunchStartTime: DateTime(_now.year, _now.month, _now.day, 12, 0),
      lunchEndtime: DateTime(_now.year, _now.month, _now.day, 13, 0),
      planDaysAhead: 30,
    );
    var result = FirebaseService().addNailSalon(nailSalon.toFirestore());
    _logger.logInfo(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingSpinner()
        : Center(
            child: SingleChildScrollView(
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
                            onChanged: (value) => _companyName = value,
                            validator:
                                RequiredValidator(errorText: "* Verplicht"),
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
                                labelText: 'Bedrijfsnaam',
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je bedrijfsnaam in'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => _firstName = value,
                            validator:
                                RequiredValidator(errorText: "* Verplicht"),
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
                                labelText: 'Voornaam',
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je vornaam in'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => _insertion = value,
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
                                labelText: 'Tussenvoegsel',
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je tussenvoegsel in'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => _lastName = value,
                            validator:
                                RequiredValidator(errorText: "* Verplicht"),
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
                                labelText: 'Achternaam',
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je achternaam in'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => _phoneNumber = value,
                            validator:
                                RequiredValidator(errorText: "* Verplicht"),
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
                                labelText: 'Telefoonnummer',
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je telefoonnummer in'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => _streetName = value,
                            validator:
                                RequiredValidator(errorText: "* Verplicht"),
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
                                labelText: 'Straatnaam',
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je straatnaam in'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) =>
                                _houseNumber = int.parse(value),
                            validator:
                                RequiredValidator(errorText: "* Verplicht"),
                            keyboardType: TextInputType.number,
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
                                labelText: 'Huisnummer',
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je huisnummer in'),
                          ),
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
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je emailadres in'),
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
                                labelStyle:
                                    const TextStyle(color: appAccentColor),
                                hintStyle:
                                    const TextStyle(color: appAccentColor),
                                hintText: 'Vul je wachtwoord in'),
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
                                      .registerWithEmailAndPassword(
                                          _email, _password);

                                  if (result != null) {
                                    _registerNailSalon(
                                      result.user.uid,
                                      _companyName,
                                      _firstName,
                                      _insertion,
                                      _lastName,
                                      _email,
                                      _phoneNumber,
                                      _streetName,
                                      _houseNumber,
                                    );

                                    setState(() {
                                      _isLoading = false;
                                    });

                                    _showSnackbarSuccess(
                                        'Registreren is gelukt!');
                                  } else {
                                    setState(() {
                                      _isLoading = false;
                                    });

                                    _logger.logError('Register failed');
                                    _showSnackbar('Registreren is mislukt!');
                                  }
                                }
                              },
                              child: const Text('Registreren'),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextButton(
                            onPressed: () {
                              widget.toggleView();
                            },
                            child: const Text(
                              'Al geregistreerd? Log in hier!',
                              style: TextStyle(color: appSubTextgroundColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
