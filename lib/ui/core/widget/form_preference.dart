import 'package:blablacarv2/model/ride/locations.dart';
import 'package:blablacarv2/ui/core/theme/theme.dart';
import 'package:blablacarv2/ui/core/widget/button.dart';
import 'package:blablacarv2/ui/core/widget/ruler.dart';
import 'package:blablacarv2/ui/viewmodel/form_view_model.dart';
import 'package:blablacarv2/ui/core/widget/date_picker.dart';
import 'package:blablacarv2/ui/core/widget/input.dart';
import 'package:blablacarv2/ui/core/widget/seat_setter.dart';
import 'package:blablacarv2/ui/core/widget/location_list.dart';
import 'package:blablacarv2/ui/screen/result/result_screen.dart';
import 'package:blablacarv2/utils/animations_util.dart';
import 'package:blablacarv2/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPreference extends StatefulWidget {
  const FormPreference({super.key, required this.openResultScreen});
  final bool openResultScreen;

  @override
  State<FormPreference> createState() => _FormPreferenceState();
}

class _FormPreferenceState extends State<FormPreference> {
  bool _isAnimate = false;

  void pickLocation(LocationType type) async {
    final vm = context.read<FormViewModel>();

    final Location? result = await Navigator.push(
      context,
      RouteHelper.createBottomToTopRoute(
        LocationList(
          valueOfLocation: type == LocationType.departure
              ? vm.ridePrefernce.departure
              : vm.ridePrefernce.arrival,
        ),
      ),
    );

    if (result == null || result.name.trim().isEmpty) {
      return; // user cancelled or selected invalid/empty
    }
    if (type == LocationType.departure) {
      vm.setDeparture(result);
    } else {
      vm.setArrival(result);
    }
  }

  void swapLocation() {
    final vm = context.read<FormViewModel>();

    setState(() {
      _isAnimate = true;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      vm.swapLocation();
      setState(() {
        _isAnimate = false;
      });
    });
  }

  void search() {
    if (widget.openResultScreen) {
      Navigator.push(
        context,
        RouteHelper.createBottomToTopRoute(ResultScreen()),
      );
    } else {
      Navigator.pop(context);
    }
  }

  void pickDate(BuildContext context) {
    final vm = context.read<FormViewModel>();

    Navigator.push(
      context,
      RouteHelper.createBottomToTopRoute(
        CustomDatePicker(
          initialDate: vm.ridePrefernce.departureDate,
          onDateSelected: (pickeDate) {
            vm.setDate(pickeDate);
          },
        ),
      ),
    );
  }

  void setSeat(BuildContext context) {
    final vm = context.read<FormViewModel>();

    Navigator.push(
      context,
      RouteHelper.createBottomToTopRoute(
        Seatsetter(
          value: vm.ridePrefernce.requestedSeats,
          onTap: (setSeat) {
            vm.setSeat(setSeat);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FormViewModel vm = context.watch<FormViewModel>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Container(
          decoration: BoxDecoration(color: BlaColors.white),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        AnimatedSlide(
                          offset: _isAnimate ? Offset(0, 0.5) : Offset(0, 0),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: AnimatedOpacity(
                            opacity: _isAnimate ? 0.3 : 1.0,
                            duration: Duration(milliseconds: 100),
                            child: Input(
                              icon: Icons.circle_outlined,
                              label: 'Leaving from',
                              valueText: vm.ridePrefernce.departure.toString(),
                              onTap: () => pickLocation(LocationType.departure),
                            ),
                          ),
                        ),
                        Ruler(),
                        AnimatedSlide(
                          offset: _isAnimate ? Offset(0, -0.5) : Offset(0, 0),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: AnimatedOpacity(
                            opacity: _isAnimate ? 0.5 : 1.0,
                            duration: Duration(milliseconds: 100),
                            child: Input(
                              icon: Icons.circle_outlined,
                              label: 'Going to',
                              valueText: vm.ridePrefernce.arrival.toString(),
                              onTap: () => pickLocation(LocationType.arrival),
                            ),
                          ),
                        ),

                        Ruler(),
                        Input(
                          valueText: DateTimeUtils.formatDateTime(
                            vm.ridePrefernce.departureDate,
                          ),
                          label: DateTimeUtils.formatDateTime(DateTime.now()),
                          onTap: () => pickDate(context),
                          icon: Icons.calendar_month_outlined,
                        ),
                        Ruler(),
                        Input(
                          label: vm.ridePrefernce.requestedSeats.toString(),
                          valueText: vm.ridePrefernce.requestedSeats.toString(),
                          onTap: () => setSeat(context),
                          icon: Icons.person,
                        ),
                      ],
                    ),
                  ),
                  Blabutton(
                    label: 'Search',
                    onPressed: search,
                    isRound: false,
                    color: ColorType.primary,
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 10,
                child: AnimatedSlide(
                  offset: _isAnimate ? Offset(0, 0.2) : Offset(0, 0),
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,

                  child: AnimatedOpacity(
                    opacity: _isAnimate ? 0.5 : 1.0,
                    duration: Duration(milliseconds: 200),

                    child:
                        vm.ridePrefernce.departure.name.isEmpty &&
                            vm.ridePrefernce.arrival.name.isEmpty
                        ? SizedBox.shrink()
                        : IconButton(
                            onPressed: () => swapLocation(),
                            icon: Icon(
                              Icons.swap_vert,
                              color: BlaColors.primary,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
