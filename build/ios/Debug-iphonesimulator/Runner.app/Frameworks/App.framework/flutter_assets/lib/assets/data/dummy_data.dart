import 'package:flutter/material.dart';

import 'package:nail_artists_hub/models/nail_salon.dart';
import 'package:nail_artists_hub/models/treatment.dart';

const nailSalonData = [
  NailSalon(
    id: 'NS1',
    companyName: 'Nails by Dennis1',
    color: Colors.purple,
  ),
  NailSalon(
    id: 'NS2',
    companyName: 'Nails by Dennis2',
    color: Colors.purple,
  ),
  NailSalon(
    id: 'NS3',
    companyName: 'Nails by Dennis3',
    color: Colors.purpleAccent,
  ),
  NailSalon(
    id: 'NS4',
    companyName: 'Nails by Dennis4',
    color: Colors.purpleAccent,
  ),
  NailSalon(
    id: 'NS5',
    companyName: 'Nails by Dennis5',
    color: Colors.purple,
  ),
  NailSalon(
    id: 'NS6',
    companyName: 'Nails by Dennis6',
    color: Colors.purple,
  ),
];

const treatmentData = [
  Treatment(
    id: 'T1',
    salonId: 'NS1',
    name: 'Acryl Nagels',
    description: 'Nieuwe set',
    price: 55,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T2',
    salonId: 'NS1',
    name: 'Acryl Nagels',
    description: 'Babyboom',
    price: 60,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T3',
    salonId: 'NS1',
    name: 'Acryl Nagels',
    description: 'French',
    price: 60,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T4',
    salonId: 'NS1',
    name: 'Acryl Nagels',
    description: 'Verwijderen',
    price: 15,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T5',
    salonId: 'NS1',
    name: 'Manicure',
    description: 'Blanke lak',
    price: 20,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T6',
    salonId: 'NS1',
    name: 'Manicure',
    description: 'Kleur lak',
    price: 25,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T7',
    salonId: 'NS1',
    name: 'Manicure',
    description: 'Bijwerken',
    price: 25,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T8',
    salonId: 'NS2',
    name: 'Acryl Nagels',
    description: 'Nieuwe set',
    price: 55,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T9',
    salonId: 'NS2',
    name: 'Acryl Nagels',
    description: 'Babyboom',
    price: 60,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T10',
    salonId: 'NS2',
    name: 'Acryl Nagels',
    description: 'French',
    price: 60,
    durationInMinutes: 30,
  ),
  Treatment(
    id: 'T11',
    salonId: 'NS2',
    name: 'Acryl Nagels',
    description: 'Verwijderen',
    price: 15,
    durationInMinutes: 30,
  )
];
