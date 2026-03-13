import 'package:blablacarv2/data/repository/ride_preference_repository.dart';

import '../model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - History of the last ride preferences        (to allow users to re-use their last preferences)
///   - Curent selected ride preferences.
///

// TODO Improve this with a proper repository and a global state
class RidePrefsService {
RidePreferenceRepository repo = RidePreferenceRepository();

  static final int maxAllowedSeats = 8;

  RidePref? get selectedPreference => repo.selectedPreference;
  List<RidePref> get preferenceHistory => repo.preferenceHistory;

  
  
}
