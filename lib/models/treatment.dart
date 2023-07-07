import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Treatment.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Treatment(
      id: data?['id'],
      nailSalonId: data?['nailSalonId'],
      name: data?['name'],
      description: data?['description'],
      price: data?['price'],
      durationInMinutes: data?['durationInMinutes'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'nailSalonId': nailSalonId,
      'name': name,
      'description': description,
      'price': price,
      'durationInMinutes': durationInMinutes,
    };
  }
}
