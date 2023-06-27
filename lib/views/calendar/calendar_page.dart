import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/views/calendar/components/body.dart';

class CalendarPage extends StatelessWidget {
  final String customerId;
  final String nailSalonId;
  final Treatment treatment;

  const CalendarPage({
    super.key,
    required this.customerId,
    required this.nailSalonId,
    required this.treatment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${treatment.name} - ${treatment.description}',
      )),
      body: Body(
        customerId: customerId,
        nailSalonId: nailSalonId,
        treatmentId: treatment.id,
      ),
    );
  }
}
