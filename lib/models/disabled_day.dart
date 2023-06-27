class DisabledDay {
  final String id;
  final String nailSalonId;
  final int day;

  const DisabledDay({
    required this.id,
    required this.nailSalonId,
    required this.day,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nailSalonId': nailSalonId,
        'day': day,
      };
}
