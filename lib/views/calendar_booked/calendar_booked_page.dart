import 'package:flutter/material.dart';

import 'package:nail_artists_hub/views/calendar_booked/components/body.dart';

class CalendarBookedPage extends StatelessWidget {
  const CalendarBookedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            // '${treatment.name} - ${treatment.description}',
            'Just a title'),
      ),
      body: const Body(),
    );
  }
}
