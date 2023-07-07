import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/services/firebase_service.dart';
import 'package:nail_artists_hub/shared/constants.dart';
import 'package:nail_artists_hub/shared/loading_spinner.dart';
import 'package:nail_artists_hub/shared/logger.dart';
import 'package:nail_artists_hub/shared/uuid.dart';
import 'package:nail_artists_hub/views/profile/profile_page.dart';

class Body extends StatefulWidget {
  final String nailSalonId;

  const Body({super.key, required this.nailSalonId});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static final _logger = Logger(loggerClass: 'AddTreatmentPage');

  final _formKey = GlobalKey<FormState>();

  var _isLoading = false;
  var _name = '';
  var _description = '';
  var _price = 0.00;
  var _durationInMinutes = 30;

  final _requiredValidator = RequiredValidator(errorText: '* Verplicht');

  final _multiValidator = MultiValidator([
    RequiredValidator(errorText: '* Verplicht'),
    PatternValidator(r'^[0-9]', errorText: 'Dit is geen geldig karakter')
  ]);

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

  Future<bool> _addTreatment(
    String name,
    String description,
    double price,
    int durationInMinutes,
  ) async {
    var treatment = Treatment(
      id: createUuid(),
      nailSalonId: widget.nailSalonId,
      name: name,
      description: description,
      price: price,
      durationInMinutes: durationInMinutes,
    );
    return await FirebaseService().addTreatment(treatment.toFirestore());
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
                          onChanged: (value) => _name = value,
                          validator: _requiredValidator,
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
                              labelText: 'Naam van behandeling',
                              labelStyle:
                                  const TextStyle(color: appAccentColor),
                              hintStyle: const TextStyle(color: appAccentColor),
                              hintText: 'Vul de naam van de behandeling in'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => _description = value,
                          validator: _requiredValidator,
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
                              labelText: 'Beschrijving van behandeling',
                              labelStyle:
                                  const TextStyle(color: appAccentColor),
                              hintStyle: const TextStyle(color: appAccentColor),
                              hintText:
                                  'Vul de beschrijving van de behandeling in'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => _price = double.parse(value),
                          validator: _multiValidator,
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
                              labelText: 'Prijs van behandeling',
                              labelStyle:
                                  const TextStyle(color: appAccentColor),
                              hintStyle: const TextStyle(color: appAccentColor),
                              hintText: 'Vul de prijs van de behandeling in'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) =>
                              _durationInMinutes = int.parse(value),
                          validator: _multiValidator,
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
                              labelText: 'Duur van behandeling',
                              labelStyle:
                                  const TextStyle(color: appAccentColor),
                              hintStyle: const TextStyle(color: appAccentColor),
                              hintText: 'Vul de duur van de behandeling in'),
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

                                dynamic result = await _addTreatment(_name,
                                    _description, _price, _durationInMinutes);

                                if (result) {
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                        nailSalonId: widget.nailSalonId),
                                  ));

                                  _showSnackbarSuccess(
                                      'Behandeling is toegevoegd!');
                                } else {
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  _logger.logError('Add treatment failed');
                                  _showSnackbar(
                                      'Behandeling is niet toegevoegd!');
                                }
                              }
                            },
                            child: const Text('Toevoegen'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
