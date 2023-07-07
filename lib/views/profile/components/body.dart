import 'package:flutter/material.dart';
import 'package:nail_artists_hub/shared/constants.dart';
import 'package:nail_artists_hub/views/add_treatment/add_treatment_page.dart';

class Body extends StatelessWidget {
  final String nailSalonId;

  const Body({super.key, required this.nailSalonId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView(
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          InkWell(
            // onTap: onSelectNailSalon,
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: appAccentColor,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Afspraken',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddTreatmentPage(
                  nailSalonId: nailSalonId,
                ),
              ));
            },
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: appAccentColor,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Behandelingen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            // onTap: onSelectNailSalon,
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: appAccentColor,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Standaard werkdagen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            // onTap: onSelectNailSalon,
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: appAccentColor,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Vrije dagen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            // onTap: onSelectNailSalon,
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: appAccentColor,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Uitloggen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
