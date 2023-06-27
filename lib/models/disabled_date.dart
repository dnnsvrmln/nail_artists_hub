class DisabledDate {
  final String id;
  final String nailSalonId;
  final DateTime dateTime;

  const DisabledDate({
    required this.id,
    required this.nailSalonId,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nailSalonId': nailSalonId,
        'dateTime': dateTime,
      };
}
