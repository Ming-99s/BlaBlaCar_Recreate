import 'package:blablacarv2/model/ride/ride.dart';
import 'package:blablacarv2/ui/core/theme/theme.dart';
import 'package:blablacarv2/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RidePreferenceCard extends StatelessWidget {
  const RidePreferenceCard({super.key,required this.ride});
  final Ride ride;
  @override
  Widget build(BuildContext context) {
  Duration rideDuration = ride.arrivalDateTime.difference(ride.departureDate);
  String formattedDuration =
        "${rideDuration.inHours}h ${rideDuration.inMinutes.remainder(60)}m";
    double indicatorSize = 12;
    double circleSize = 9;
    double afterline = 5;
    double beforeline = 5;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BlaColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: BlaColors.greyLight,

            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(DateTimeUtils.formatTime(ride.departureDate), style: BlaTextStyles.time),
                      Text(formattedDuration),
                      SizedBox(height: 1),

                      Text(DateTimeUtils.formatTime(ride.arrivalDateTime), style: BlaTextStyles.time),
                    ],
                  ),

                  const SizedBox(width: 10),

                  SizedBox(
                    width: 160,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TimelineTile(
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              width: indicatorSize,
                              iconStyle: IconStyle(
                                iconData: Icons.circle,
                                color: BlaColors.white,
                                fontSize: circleSize,
                              ),
                              color: BlaColors.secondary,
                            ),

                            afterLineStyle: LineStyle(
                              thickness: afterline,
                              color: BlaColors.secondary,
                            ),
                            endChild: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                '${ride.departureLocation}',
                                style: BlaTextStyles.loc,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: TimelineTile(
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              width: indicatorSize,
                              color: BlaColors.secondary,
                              iconStyle: IconStyle(
                                iconData: Icons.circle,
                                color: BlaColors.white,
                                fontSize: circleSize,
                              ),
                            ),
                            beforeLineStyle: LineStyle(
                              color: BlaColors.secondary,
                              thickness: beforeline,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                '${ride.arrivalLocation}',
                                style: BlaTextStyles.loc,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text('\$2.99', style: BlaTextStyles.price),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),

          Divider(color: BlaColors.iconLight, thickness: 0.5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.local_taxi),
                  SizedBox(width: 10),
                  CircleAvatar(
                    child: Icon(Icons.person, color: BlaColors.white),
                    backgroundColor: BlaColors.backgroundAccent,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, size: 15, color: BlaColors.neutral),
                          SizedBox(width: 3),
                          Text('1'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              Icon(Icons.flash_on_sharp),
            ],
          ),
        ],
      ),
    );
  }
}
