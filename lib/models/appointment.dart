class Appointment {
  // final String id;
  final String customerId;
  final String nailSalonId;
  final String treatmentId;
  final DateTime dateAndTime;

  const Appointment({
    // required this.id,
    required this.customerId,
    required this.nailSalonId,
    required this.treatmentId,
    required this.dateAndTime,
  });

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'nailSalonId': nailSalonId,
        'treatmentId': treatmentId,
        'dateAndTime': dateAndTime.toIso8601String(),
      };
}
