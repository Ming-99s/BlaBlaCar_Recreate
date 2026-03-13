import 'package:blablacarv2/model/ride/ride.dart';
import 'package:blablacarv2/model/ride_pref/ride_pref.dart';
import 'package:blablacarv2/service/ride_service.dart';
import 'package:flutter/material.dart';

class ResultViewModel extends ChangeNotifier {
  RidesService ridesService = RidesService();

  List<Ride> getAllRide(RidePref ridePref) {
    return ridesService.repo.getRidesFor(ridePref);
  }
}
