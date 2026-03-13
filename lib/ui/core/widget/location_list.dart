import 'package:blablacarv2/data/repository/location_repository.dart';
import 'package:blablacarv2/model/ride/locations.dart';
import 'package:blablacarv2/ui/core/theme/theme.dart';
import 'package:blablacarv2/ui/core/widget/location_tile.dart';
import 'package:blablacarv2/ui/viewmodel/location_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationList extends StatefulWidget {
  const LocationList({super.key, required this.valueOfLocation});
  final Location valueOfLocation;

  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {

@override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<LocationListViewModel>();
      final initialName = widget.valueOfLocation.name.trim();
        vm.setSearchValue(initialName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LocationListViewModel>();
    final historyLength = vm.locations[LocationType.history]!.length;
    final normalLength = vm.locations[LocationType.normal]!.length;
    final totalLength = historyLength + normalLength;
    return Scaffold(
      backgroundColor: BlaColors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: BlaColors.white),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: vm.searchController,
                onChanged: (value) => vm.updateSearch(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: BlaColors.greyLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,

                  labelText: 'Search',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(Icons.chevron_left),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  suffixIcon: vm.searchController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: vm.clearSearch,
                          ),
                        )
                      : null,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: totalLength,
                  itemBuilder: (context, index) {
                    if (index < historyLength) {
                      final loc = vm.locations[LocationType.history]![index];
                      return LocationTile(
                        city: loc.name,
                        country: loc.country.name,
                        onTap: () {
                          Navigator.pop(context, loc);
                        },
                        isHistoryTile: true,
                      );
                    } else {
                      final loc =
                          vm.locations[LocationType.normal]![index -
                              historyLength];
                      return LocationTile(
                        city: loc.name,
                        country: loc.country.name,
                        onTap: () {
                          if (!vm.locations[LocationType.history]!.contains(
                            loc,
                          )) {
                            vm.selectLocation(loc);
                          }
                          Navigator.pop(context, loc);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
