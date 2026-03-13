import 'package:blablacarv2/data/dummy_data.dart';
import 'package:blablacarv2/model/ride/ride.dart';
import 'package:blablacarv2/model/ride_pref/ride_pref.dart';

class RideRepository {
    final List<Ride> _allRides = fakeRides;

    List<Ride> getRidesFor(RidePref preferences) {
    return _allRides
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }
}