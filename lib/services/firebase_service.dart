import 'package:nail_artists_hub/models/nail_salon.dart';

import 'package:nail_artists_hub/assets/data/dummy_data.dart';
import 'package:nail_artists_hub/models/treatment.dart';

class FirebaseService {
  List<NailSalon> getAllNailSalons() {
    return nailSalonData;
  }

  List<Treatment> getAllTreatments() {
    return treatmentData;
  }

  List<Treatment> getAllTreatmentsBySalonId(String nailSalonId) {
    return treatmentData
        .where((treatment) => treatment.salonId.contains(nailSalonId))
        .toList();
  }
}
