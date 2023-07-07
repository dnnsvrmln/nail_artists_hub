import 'package:flutter/material.dart';
import 'package:nail_artists_hub/models/nail_salon.dart';

import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/shared/base_app_bar.dart';
import 'package:nail_artists_hub/views/calendar/components/body.dart';

class CalendarPage extends StatelessWidget {
  final String customerId;
  final NailSalon nailSalon;
  final Treatment treatment;

  const CalendarPage({
    super.key,
    required this.customerId,
    required this.nailSalon,
    required this.treatment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: '${treatment.name} - ${treatment.description}'),
      body: Body(
        customerId: customerId,
        nailSalon: nailSalon,
        treatmentId: treatment.id,
      ),
    );
  }
}
