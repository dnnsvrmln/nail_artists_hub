import 'package:flutter/material.dart';
import 'package:nail_artists_hub/shared/base_app_bar.dart';
import 'package:nail_artists_hub/views/add_treatment/components/body.dart';

class AddTreatmentPage extends StatelessWidget {
  final String nailSalonId;

  const AddTreatmentPage({super.key, required this.nailSalonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'Behandeling Toevoegen'),
      body: Body(nailSalonId: nailSalonId),
    );
  }
}
