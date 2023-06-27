import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/views/treatments/components/body.dart';

class TreatmentsPage extends StatelessWidget {
  final String title;
  final String customerId;
  final String nailSalonId;
  final List<Treatment> treatmentList;

  const TreatmentsPage({
    super.key,
    required this.title,
    required this.customerId,
    required this.nailSalonId,
    required this.treatmentList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Body(
        customerId: customerId,
        nailSalonId: nailSalonId,
        treatmentList: treatmentList,
      ),
    );
  }
}
