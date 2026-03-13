import 'package:blablacarv2/data/repository/location_repository.dart';
import 'package:blablacarv2/model/ride/locations.dart';
import 'package:blablacarv2/service/location_service.dart';
import 'package:flutter/material.dart';

class LocationListViewModel extends ChangeNotifier {
  final LocationsService service;
  TextEditingController searchController = TextEditingController();

  Map<LocationType, List<Location>> locations = {
    LocationType.history: [],
    LocationType.normal: [],
  };
  LocationListViewModel({required this.service}) {
    locations = service.searchDepartureName(null)!;
  }

  void setSearchValue(String text) {
    searchController.text = text;
    notifyListeners();
  }

  void updateSearch(String text) {
    locations = service.searchDepartureName(text)!;
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    locations = service.searchDepartureName(null)!;
    notifyListeners();
  }

  void selectLocation(Location loc) {
    service.addToHistory(loc);
    updateSearch(searchController.text);
  }
}
