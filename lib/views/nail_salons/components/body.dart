import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/nail_salon.dart';

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
          gradient: LinearGradient(
            colors: [
              nailSalon.color.withOpacity(0.55),
              nailSalon.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(nailSalon.id),
      ),
    );
  }
}
