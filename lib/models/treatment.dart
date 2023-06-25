class Treatment {
  final String id;
  final String salonId;
  final String name;
  final String description;
  final double price;
  final int durationInMinutes;

  const Treatment({
    required this.id,
    required this.salonId,
    required this.name,
    required this.description,
    required this.price,
    required this.durationInMinutes,
  });
}
