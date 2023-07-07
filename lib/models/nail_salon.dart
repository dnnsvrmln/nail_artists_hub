import 'package:cloud_firestore/cloud_firestore.dart';

class NailSalon {
  final String id;
  final String companyName;
  final String firstName;
  final String? insertion;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String streetName;
  final int houseNumber;
  DateTime workdayStartTime;
  DateTime workdayEndTime;
  DateTime lunchStartTime;
  DateTime lunchEndtime;
  final int planDaysAhead;

  NailSalon({
    required this.id,
    required this.companyName,
    required this.firstName,
    this.insertion,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.streetName,
    required this.houseNumber,
    required this.workdayStartTime,
    required this.workdayEndTime,
    required this.lunchStartTime,
    required this.lunchEndtime,
    required this.planDaysAhead,
  });

  factory NailSalon.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return NailSalon(
      id: data?['id'],
      companyName: data?['companyName'],
      firstName: data?['firstName'],
      insertion: data?['insertion'],
      lastName: data?['lastName'],
      email: data?['email'],
      phoneNumber: data?['phoneNumber'],
      streetName: data?['streetName'],
      houseNumber: data?['houseNumber'],
      workdayStartTime: (data?['workdayStartTime'] as Timestamp).toDate(),
      workdayEndTime: (data?['workdayEndTime'] as Timestamp).toDate(),
      lunchStartTime: (data?['lunchStartTime'] as Timestamp).toDate(),
      lunchEndtime: (data?['lunchEndtime'] as Timestamp).toDate(),
      planDaysAhead: data?['planDaysAhead'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'companyName': companyName,
      'firstName': firstName,
      'insertion': insertion,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'streetName': streetName,
      'houseNumber': houseNumber,
      'workdayStartTime': workdayStartTime,
      'workdayEndTime': workdayEndTime,
      'lunchStartTime': lunchStartTime,
      'lunchEndtime': lunchEndtime,
      'planDaysAhead': planDaysAhead,
    };
  }
}
