import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:nail_artists_hub/models/appointment.dart';
import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/services/firebase_service.dart';
import 'package:nail_artists_hub/shared/constants.dart';
import 'package:nail_artists_hub/shared/loading_spinner.dart';

import 'package:nail_artists_hub/shared/logger.dart';
import 'package:nail_artists_hub/views/calendar_booked/calendar_booked_page.dart';

class Body extends StatefulWidget {
  final String customerId;
  final NailSalon nailSalon;
  final String treatmentId;

  const Body({
    super.key,
    required this.customerId,
    required this.nailSalon,
    required this.treatmentId,
  });

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static final _logger = Logger(loggerClass: 'CalendarPageBody');
  static final _now = DateTime.now();

  late BookingService bookingService;

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: appSubTextgroundColor,
      ),
    );
  }

  void _showSnackbarSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: appAccentColor,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bookingService = BookingService(
      serviceName: 'Nail Artists Hub',
      serviceDuration: 30,
      bookingEnd: widget.nailSalon.workdayEndTime,
      bookingStart: widget.nailSalon.workdayStartTime,
    );
  }

  Stream<dynamic>? getBookingStreamFirebase(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultFirebase(
      {required dynamic streamResult}) {
    DateTime first = _now;
    DateTime tomorrow = _now.add(Duration(days: 1));
    DateTime second = _now.add(const Duration(minutes: 55));
    DateTime third = _now.subtract(const Duration(minutes: 240));
    DateTime fourth = _now.subtract(const Duration(minutes: 500));

    converted.add(DateTimeRange(
        start: first, end: _now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }

  Future<dynamic> uploadBookingFirebase(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));

    var appointment = Appointment(
        customerId: widget.customerId,
        nailSalonId: widget.nailSalon.id,
        treatmentId: widget.treatmentId,
        bookingStart: newBooking.bookingStart,
        bookingEnd: newBooking.bookingEnd);

    var result =
        await FirebaseService().addAppointment(appointment.toFirestore());

    if (result) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CalendarBookedPage()));

      _showSnackbarSuccess('Afspraak is geboekt!');
    } else {
      _logger.logError('Add treatment failed');
      _showSnackbar('Afspraak is niet geboekt!');
    }
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: widget.nailSalon.lunchStartTime,
          end: widget.nailSalon.lunchEndtime)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Center(
        child: BookingCalendar(
          // Required parameters
          bookingService: bookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultFirebase,
          getBookingStream: getBookingStreamFirebase,
          uploadBooking: uploadBookingFirebase,
          // convertStreamResultToDateTimeRanges: convertStreamResult,
          // getBookingStream: getBookingStream2,
          // uploadBooking: uploadBooking,
          // Optional parameters
          bookingButtonColor: appAccentColor,
          bookingButtonText: 'Boek afspraak',
          bookedSlotColor: appSubTextgroundColor,
          bookedSlotText: 'Geboekt',
          selectedSlotColor: appTextgroundColor,
          selectedSlotText: 'Gekozen',
          availableSlotColor: appAccentColor,
          availableSlotText: 'Beschikbaar',
          pauseSlots: generatePauseSlots(),
          pauseSlotText: 'Pauze',
          hideBreakTime: false,
          loadingWidget: const LoadingSpinner(),
          uploadingWidget: const LoadingSpinner(),
          locale: 'nl_NL',
          startingDayOfWeek: StartingDayOfWeek.monday,
          wholeDayIsBookedWidget: const Text(
            'Sorry, alles is volgeboekt voor deze dag!',
            style: TextStyle(color: appSubTextgroundColor),
          ),
        ),
      ),
    );
  }
}
