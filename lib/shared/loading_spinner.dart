import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nail_artists_hub/shared/constants.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackgroundColor,
      child: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.pinkAccent.shade100,
          size: 50.0,
        ),
      ),
    );
  }
}
