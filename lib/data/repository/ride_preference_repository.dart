import 'package:blablacarv2/model/ride_pref/ride_pref.dart';

class RidePreferenceRepository {
  RidePref? _selectedPreference;
  final List<RidePref> _preferenceHistory = [];

  RidePref? get selectedPreference => _selectedPreference;
  List<RidePref> get preferenceHistory => _preferenceHistory;
  void _addPreferenceToHistory(RidePref preference) {
    _preferenceHistory.insert(0, preference);
  }

  void selectPreference(RidePref preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      _addPreferenceToHistory(preference);
    }
  }
}
