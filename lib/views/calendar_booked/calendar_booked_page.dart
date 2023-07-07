import 'package:flutter/material.dart';
import 'package:nail_artists_hub/shared/base_app_bar.dart';

import 'package:nail_artists_hub/views/calendar_booked/components/body.dart';

class CalendarBookedPage extends StatelessWidget {
  const CalendarBookedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(title: 'Bedankt voor uw boeking!'),
      body: Body(),
    );
  }
}
