import 'package:blablacarv2/model/ride_pref/ride_pref.dart';
import 'package:blablacarv2/ui/core/theme/theme.dart';
import 'package:blablacarv2/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class RidePreferenceTile extends StatelessWidget {
  const RidePreferenceTile({
    super.key,
    required this.back,
    required this.onEdit,
    required this.ridePref,
  });
  final Function() onEdit;
  final Function() back;
  final RidePref ridePref;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Row(
          children: [
            Text('${ridePref.departure}'),
            Icon(Icons.arrow_forward,size: 18,),
            Text('${ridePref.arrival}'),
          ],
        ),
        subtitle: Text('${DateTimeUtils.formatDateTime(ridePref.departureDate)}, ${ridePref.requestedSeats} passenger'),
        leading: IconButton(onPressed: back, icon: Icon(Icons.chevron_left)),
        onTap: onEdit,
      ),
    );
  }
}
