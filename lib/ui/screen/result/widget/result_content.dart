import 'package:blablacarv2/data/dummy_data.dart';
import 'package:blablacarv2/model/ride/ride.dart';
import 'package:blablacarv2/ui/core/theme/theme.dart';
import 'package:blablacarv2/ui/core/widget/form_preference.dart';
import 'package:blablacarv2/ui/screen/result/widget/ride_preference_card.dart';
import 'package:blablacarv2/ui/screen/result/widget/ride_preference_tile.dart';
import 'package:blablacarv2/ui/viewmodel/form_view_model.dart';
import 'package:blablacarv2/ui/viewmodel/result_view_model.dart';
import 'package:blablacarv2/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultContent extends StatelessWidget {
  const ResultContent({super.key});

  @override
  Widget build(BuildContext context) {
    final FormViewModel vm = context.watch<FormViewModel>();
    final ResultViewModel vmr = context.watch<ResultViewModel>();
    List<Ride> allride = vmr.getAllRide(vm.ridePrefernce);
    void back() {
      Navigator.pop(context);
    }

    void onEdit() {
      Navigator.push(
        context,
        RouteHelper.createTopToMidRoute(
          Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [FormPreference(openResultScreen: false)],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: BlaColors.neutralLighter,
        automaticallyImplyLeading: false,
        title: RidePreferenceTile(
          back: back,
          onEdit: onEdit,
          ridePref: vm.ridePrefernce,
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today', style: BlaTextStyles.price),
                SizedBox(height: 10),

                Expanded(
                  child: ListView.builder(
                    itemCount: allride.length,
                    itemBuilder: (context, index) {
                      return RidePreferenceCard(ride: allride[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
