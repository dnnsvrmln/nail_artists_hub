import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/services/firebase_service.dart';
import 'package:nail_artists_hub/shared/loading_spinner.dart';
import 'package:nail_artists_hub/views/nail_salons/components/body.dart';
import 'package:nail_artists_hub/views/treatments/treatments_page.dart';

class NailSalonPage extends StatefulWidget {
  const NailSalonPage({super.key});

  @override
  State<NailSalonPage> createState() => _NailSalonPageState();
}

class _NailSalonPageState extends State<NailSalonPage> {
  void _selectNailSalon(BuildContext context, NailSalon nailSalon) {
    // Navigator.push(context, route);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TreatmentsPage(
        title: nailSalon.companyName,
        customerId: 'C1',
        nailSalon: nailSalon,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseService().getAllNailSalons(),
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
              for (final nailSalon in snapshot.data!)
                Body(
                  nailSalon: nailSalon,
                  onSelectNailSalon: () {
                    _selectNailSalon(context, nailSalon);
                  },
                )
            ],
          );
        }
      },
    );
  }
}
