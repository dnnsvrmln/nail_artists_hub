import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/services/firebase_service.dart';
import 'package:nail_artists_hub/views/nail_salons/components/body.dart';
import 'package:nail_artists_hub/views/treatments/treatments_page.dart';

class NailSalonPage extends StatelessWidget {
  const NailSalonPage({super.key});

  void _selectNailSalon(BuildContext context, NailSalon nailSalon) {
    var treatments =
        FirebaseService().getAllTreatmentsByNailSalonIdData(nailSalon.id);

    // Navigator.push(context, route);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TreatmentsPage(
        title: nailSalon.companyName,
        customerId: 'C1',
        nailSalonId: nailSalon.id,
        treatmentList: treatments,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // homePageData.map((home) => Body(home: home)).toList();
        for (final nailSalon in FirebaseService().getAllNailSalonsData())
          Body(
            nailSalon: nailSalon,
            onSelectNailSalon: () {
              _selectNailSalon(context, nailSalon);
            },
          )
      ],
    );
  }
}
