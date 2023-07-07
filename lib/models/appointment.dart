import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class Appointment {
  // final String id;
  final String customerId;
  final String nailSalonId;
  final String treatmentId;
  @JsonKey(fromJson: timeStampToDateTime, toJson: dateTimeToTimeStamp)
  final DateTime bookingStart;
  @JsonKey(fromJson: timeStampToDateTime, toJson: dateTimeToTimeStamp)
  final DateTime bookingEnd;

  const Appointment({
    // required this.id,
    required this.customerId,
    required this.nailSalonId,
    required this.treatmentId,
    required this.bookingStart,
    required this.bookingEnd,
  });

  //Because we are storing timestamp in Firestore, we need a converter for DateTime
  static DateTime timeStampToDateTime(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }

  static Timestamp dateTimeToTimeStamp(DateTime? dateTime) {
    return Timestamp.fromDate(dateTime ?? DateTime.now()); //To TimeStamp
  }

  factory Appointment.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Appointment(
      customerId: data?['customerId'],
      nailSalonId: data?['nailSalonId'],
      treatmentId: data?['treatmentId'],
      bookingStart: data?['bookingStart'],
      bookingEnd: data?['bookingEnd'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'customerId': customerId,
      'nailSalonId': nailSalonId,
      'treatmentId': treatmentId,
      'bookingStart': bookingStart,
      'bookingEnd': bookingEnd,
    };
  }
}
