import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:nail_artists_hub/shared/logger.dart';
import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/assets/data/dummy_data.dart';

class FirebaseService {
  static final _logger = Logger(loggerClass: 'FirebaseService');
  static final _database = FirebaseFirestore.instance;

  static const _appointmentsPath = 'appointments';
  static const _customersPath = 'customers';
  static const _disabledDatesPath = 'disabled-dates';
  static const _disabledDaysPath = 'disabled-days';
  static const _nailSalonsPath = 'nail-salons';
  static const _treatmentsPath = 'treatments';

  List<NailSalon> getAllNailSalonsData() {
    return nailSalonData;
  }

  List<Treatment> getAllTreatmentsData() {
    return treatmentData;
  }

  List<Treatment> getAllTreatmentsByNailSalonIdData(String nailSalonId) {
    return treatmentData
        .where((treatment) => treatment.nailSalonId.contains(nailSalonId))
        .toList();
  }

  //////////////////////////////////////////////////////////////////////

  Future<bool> addAppointment(Map<String, dynamic> body) async {
    return await _database.collection(_appointmentsPath).add(body).then(
      (DocumentReference doc) {
        if (doc.id.isEmpty) {
          return false;
        } else {
          return true;
        }
      },
    );
  }

  Future getAllAppointmentsByCustomerId(String customerId) async {
    return await _database
        .collection(_appointmentsPath)
        .where('customerId', isEqualTo: customerId)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _logger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future<dynamic> uploadBookingFirebase(
      {required BookingService newBooking}) async {
    var appointmentCollection = _database.collection(_appointmentsPath);
    await appointmentCollection
        .doc()
        .collection(_appointmentsPath)
        .add(newBooking.toJson())
        .then((value) => _logger.logInfo("Booking Added"))
        .catchError(
            (error) => _logger.logError("Failed to add booking: $error"));
  }

  Future getAllAppointmentsByNailSalonId(String nailSalonId) {
    return _database
        .collection(_appointmentsPath)
        .where('nailSalonId', isEqualTo: nailSalonId)
        .get();
    // var appointments = querySnapshot.docs
    //     .map((appointment) => Appointment.fromSnapshot(appointment))
    //     .toList();

    // return appointments;

    // throw 'No appointments found!';
  }

  Future addCustomer(Map<String, dynamic> body) async {
    return await _database.collection(_customersPath).add(body).then(
        (DocumentReference doc) =>
            _logger.logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getCustomerById(String customerId) async {
    return await _database
        .collection(_nailSalonsPath)
        .where('customerId', isEqualTo: customerId)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _logger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addDisabledDate(Map<String, dynamic> body) async {
    return await _database.collection(_disabledDatesPath).add(body).then(
        (DocumentReference doc) =>
            _logger.logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getDisabledDatesByNailSalonId(String nailSalonIid) async {
    return await _database
        .collection(_disabledDatesPath)
        .where('nailSalonId', isEqualTo: nailSalonIid)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _logger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addDisabledDay(Map<String, dynamic> body) async {
    return await _database.collection(_disabledDaysPath).add(body).then(
        (DocumentReference doc) =>
            _logger.logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getDisabledDaysByNailSalonId(String nailSalonIid) async {
    return await _database
        .collection(_disabledDaysPath)
        .where('nailSalonId', isEqualTo: nailSalonIid)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _logger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addNailSalon(Map<String, dynamic> body) async {
    await _database.collection(_nailSalonsPath).add(body).then(
        (DocumentReference doc) =>
            _logger.logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<List<NailSalon>> getAllNailSalons() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> nailSalonsQuery =
          await _database.collection(_nailSalonsPath).get();
      return nailSalonsQuery.docs
          .map((nailSalon) => NailSalon.fromFirestore(nailSalon))
          .toList();
    } catch (error) {
      throw 'Oeps, er is een fout opgetreden!';
    }
  }

  Future<NailSalon> getNailSalonById(String nailSalonId) async {
    var querySnapshot = await _database
        .collection(_nailSalonsPath)
        .where('id', isEqualTo: nailSalonId)
        .limit(1)
        .get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      return NailSalon(
        id: data['id'],
        companyName: data['companyName'],
        firstName: data['firstName'],
        insertion: data['insertion'],
        lastName: data['lastName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        streetName: data['streetName'],
        houseNumber: data['houseNumber'],
        workdayStartTime: (data['workdayStartTime'] as Timestamp).toDate(),
        workdayEndTime: (data['workdayEndTime'] as Timestamp).toDate(),
        lunchStartTime: (data['lunchStartTime'] as Timestamp).toDate(),
        lunchEndtime: (data['lunchEndtime'] as Timestamp).toDate(),
        planDaysAhead: data['planDaysAhead'],
      );
    }

    throw 'Nail Salon not found';
  }

  Future<bool> addTreatment(Map<String, dynamic> body) async {
    return await _database.collection(_treatmentsPath).add(body).then(
      (DocumentReference doc) {
        if (doc.id.isEmpty) {
          return false;
        } else {
          return true;
        }
      },
    );
  }

  Future<List<Treatment>> getAllTreatmentsBySalonId(String nailSalonId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> treatmentsQuery =
          await _database
              .collection(_treatmentsPath)
              .where('nailSalonId', isEqualTo: nailSalonId)
              .get();
      return treatmentsQuery.docs
          .map((treatment) => Treatment.fromFirestore(treatment))
          .toList();
    } catch (error) {
      throw 'Oeps, er is een fout opgetreden!';
    }
  }
}
