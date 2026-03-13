import 'package:blablacarv2/model/ride/locations.dart';
import 'package:blablacarv2/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

enum LocationType { departure, arrival }

class FormViewModel extends ChangeNotifier {
  static final defaultLocation = Location(name: '', country: Country.france);

  RidePref _ridePref = RidePref(
    departure: defaultLocation,
    departureDate: DateTime.now(),
    arrival: defaultLocation,
    requestedSeats: 1,
  );

  RidePref get ridePrefernce => _ridePref;
  void setDeparture(Location value) {
    _ridePref = _ridePref.copyWith(departure: value);
    notifyListeners();
  }

  void setArrival(Location value) {
    _ridePref = _ridePref.copyWith(arrival: value);
    notifyListeners();
  }

  void setDate(DateTime value) {
    _ridePref = _ridePref.copyWith(departureDate: value);
    notifyListeners();
  }

  void swapLocation() {
    _ridePref = _ridePref.copyWith(
      departure: _ridePref.arrival,
      arrival: _ridePref.departure,
    );
    notifyListeners();
  }

  void setSeat(int value) {
    _ridePref = _ridePref.copyWith(requestedSeats: value);
    notifyListeners();
  }
}
