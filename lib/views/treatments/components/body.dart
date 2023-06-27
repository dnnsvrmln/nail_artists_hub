import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/views/calendar/calendar_page.dart';
import 'package:nail_artists_hub/views/treatments/components/body_item.dart';

class Body extends StatelessWidget {
  final String customerId;
  final String nailSalonId;
  final List<Treatment> treatmentList;

  const Body({
    super.key,
    required this.customerId,
    required this.nailSalonId,
    required this.treatmentList,
  });

  void _selectTreatment(BuildContext context, Treatment treatment) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CalendarPage(
        customerId: customerId,
        nailSalonId: nailSalonId,
        treatment: treatment,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Oops, geen behandelingen!'),
          SizedBox(height: 16),
          Text('Selecteer een andere salon!'),
        ],
      ),
    );

    if (treatmentList.isNotEmpty) {
      body = ListView.builder(
        itemCount: treatmentList.length,
        itemBuilder: (context, index) => BodyItem(
          treatment: treatmentList[index],
          onSelectTreatment: (treatment) {
            _selectTreatment(context, treatment);
          },
        ),
      );
    }

    return body;
  }
}
