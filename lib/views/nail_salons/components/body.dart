import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/shared/constants.dart';

class Body extends StatelessWidget {
  final NailSalon nailSalon;
  final void Function() onSelectNailSalon;

  const Body({
    super.key,
    required this.nailSalon,
    required this.onSelectNailSalon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectNailSalon,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: appAccentColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            nailSalon.companyName,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
