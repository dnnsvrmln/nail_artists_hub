import 'package:flutter/material.dart';
import 'package:nail_artists_hub/models/nail_salon.dart';

import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/services/firebase_service.dart';
import 'package:nail_artists_hub/shared/loading_spinner.dart';
import 'package:nail_artists_hub/views/calendar/calendar_page.dart';
import 'package:nail_artists_hub/views/treatments/components/body_item.dart';

class Body extends StatelessWidget {
  final String customerId;
  final NailSalon nailSalon;

  const Body({
    super.key,
    required this.customerId,
    required this.nailSalon,
  });

  void _selectTreatment(BuildContext context, Treatment treatment) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CalendarPage(
        customerId: customerId,
        nailSalon: nailSalon,
        treatment: treatment,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseService().getAllTreatmentsBySalonId(nailSalon.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LoadingSpinner(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Oeps, er is een fout opgetreden!'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => BodyItem(
              treatment: snapshot.data![index],
              onSelectTreatment: (treatment) {
                _selectTreatment(context, treatment);
              },
            ),
          );
        }
      },
    );

    //   Widget body = const Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Text(
    //           'Oops, geen behandelingen!',
    //           style: TextStyle(color: appSubTextgroundColor),
    //         ),
    //         SizedBox(height: 16),
    //         Text(
    //           'Selecteer een andere salon!',
    //           style: TextStyle(color: appSubTextgroundColor),
    //         ),
    //       ],
    //     ),
    //   );

    //   if (treatmentList.isNotEmpty) {
    //   body = ListView.builder(
    //     itemCount: treatmentList.length,
    //     itemBuilder: (context, index) => BodyItem(
    //       treatment: treatmentList[index],
    //       onSelectTreatment: (treatment) {
    //         _selectTreatment(context, treatment);
    //       },
    //     ),
    //   );
    // }

    //   return body;
    // }
  }
}
