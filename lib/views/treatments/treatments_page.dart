import 'package:flutter/material.dart';
import 'package:nail_artists_hub/models/nail_salon.dart';

import 'package:nail_artists_hub/shared/base_app_bar.dart';
import 'package:nail_artists_hub/views/treatments/components/body.dart';

class TreatmentsPage extends StatelessWidget {
  final String title;
  final String customerId;
  final NailSalon nailSalon;

  const TreatmentsPage({
    super.key,
    required this.title,
    required this.customerId,
    required this.nailSalon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: title,
      ),
      body: Body(
        customerId: customerId,
        nailSalon: nailSalon,
      ),
    );
  }
}
