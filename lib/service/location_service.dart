import 'package:blablacarv2/data/dummy_data.dart';
import 'package:blablacarv2/data/repository/location_repository.dart';
import 'package:blablacarv2/model/ride/locations.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  LocationRepository repo = LocationRepository();

  Map<LocationType, List<Location>>? searchDepartureName(
    String? departureName,
  ) {
    if (departureName == null || departureName.length < 2) {
      return {
        LocationType.history: repo.historylocation,
        LocationType.normal: [],
      };
    }
    return repo.filterLocation(departureName);
  }

  void addToHistory(Location loc) {
    repo.addToHistory(loc);
  }

}
