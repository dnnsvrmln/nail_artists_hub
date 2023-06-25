import 'package:flutter/material.dart';

class NailSalon {
  final String id;
  final String companyName;
  final Color color;

  const NailSalon({
    required this.id,
    required this.companyName,
    this.color = Colors.pinkAccent,
  });
}
