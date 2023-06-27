class Treatment {
  final String id;
  final String nailSalonId;
  final String name;
  final String description;
  final double price;
  final int durationInMinutes;

  const Treatment({
    required this.id,
    required this.nailSalonId,
    required this.name,
    required this.description,
    required this.price,
    required this.durationInMinutes,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nailSalonId': nailSalonId,
        'name': name,
        'description': description,
        'price': price,
        'durationInMinutes': durationInMinutes,
      };
}
