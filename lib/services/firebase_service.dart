import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:nail_artists_hub/commons/logger.dart';
import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/assets/data/dummy_data.dart';

class FirebaseService {
  static final _commonsLogger = CommonsLogger(loggerClass: 'FirebaseService');
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

  Future addAppointment(Map<String, dynamic> body) async {
    return await _database.collection(_appointmentsPath).add(body).then(
        (DocumentReference doc) => _commonsLogger
            .logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getAllAppointmentsByCustomerId(String customerId) async {
    return await _database
        .collection(_appointmentsPath)
        .where('customerId', isEqualTo: customerId)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _commonsLogger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future getAllAppointmentsByNailSalonId(String nailSalonIid) async {
    return await _database
        .collection(_appointmentsPath)
        .where('nailSalonId', isEqualTo: nailSalonIid)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _commonsLogger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addCustomer(Map<String, dynamic> body) async {
    return await _database.collection(_customersPath).add(body).then(
        (DocumentReference doc) => _commonsLogger
            .logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getCustomerById(String customerId) async {
    return await _database
        .collection(_nailSalonsPath)
        .where('customerId', isEqualTo: customerId)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _commonsLogger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addDisabledDate(Map<String, dynamic> body) async {
    return await _database.collection(_disabledDatesPath).add(body).then(
        (DocumentReference doc) => _commonsLogger
            .logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getDisabledDatesByNailSalonId(String nailSalonIid) async {
    return await _database
        .collection(_disabledDatesPath)
        .where('nailSalonId', isEqualTo: nailSalonIid)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _commonsLogger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addDisabledDay(Map<String, dynamic> body) async {
    return await _database.collection(_disabledDaysPath).add(body).then(
        (DocumentReference doc) => _commonsLogger
            .logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getDisabledDaysByNailSalonId(String nailSalonIid) async {
    return await _database
        .collection(_disabledDaysPath)
        .where('nailSalonId', isEqualTo: nailSalonIid)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _commonsLogger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addNailSalon(Map<String, dynamic> body) async {
    return await _database.collection(_nailSalonsPath).add(body).then(
        (DocumentReference doc) => _commonsLogger
            .logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getAllNailSalons() async {
    return await _database
        .collection(_nailSalonsPath)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _commonsLogger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }

  Future addTreatment(Map<String, dynamic> body) async {
    return await _database.collection(_treatmentsPath).add(body).then(
        (DocumentReference doc) => _commonsLogger
            .logInfo('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future getAllTreatmentsBySalonId(String nailSalonId) async {
    return await _database
        .collection(_treatmentsPath)
        .where('nailSalonId', isEqualTo: nailSalonId)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        _commonsLogger.logInfo("${docSnapshot.id} => ${docSnapshot.data()}");
      }
    });
  }
}
