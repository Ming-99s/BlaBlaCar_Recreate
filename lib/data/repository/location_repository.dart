import 'package:blablacarv2/data/dummy_data.dart';
import 'package:blablacarv2/model/ride/locations.dart';

enum LocationType { history, normal }

class LocationRepository {
  final List<Location> _listLocation = fakeLocations;

  final List<Location> _historyLocation = [];

  List<Location> get historylocation => _historyLocation;

  Map<LocationType, List<Location>> filterLocation(String locationName) {
    final lowerSearch = locationName.toLowerCase();

    List<Location> histroyLocation = _historyLocation
        .where((l) => l.name.toLowerCase().startsWith(lowerSearch))
        .toList();

    List<Location> filteredLocation = _listLocation
        .where(
          (l) =>
              l.name.toLowerCase().startsWith(lowerSearch) &&
              !_historyLocation.contains(l),
        )
        .toList();

    return {
      LocationType.history: histroyLocation,
      LocationType.normal: filteredLocation,
    };
  }

  void addToHistory(Location location) {
    _historyLocation.insert(0, location);
  }
}
