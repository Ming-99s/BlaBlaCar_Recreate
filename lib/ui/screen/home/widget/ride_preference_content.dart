import 'package:blablacarv2/service/location_service.dart';
import 'package:blablacarv2/ui/core/theme/theme.dart';
import 'package:blablacarv2/ui/core/widget/form_preference.dart';
import 'package:blablacarv2/ui/viewmodel/location_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidePreferenceContent extends StatelessWidget {
  const RidePreferenceContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BlaColors.white,
      body: Center(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,

              children: [
                Image.asset('./assets/images/blabla_home.png'),
                Positioned(
                  top: 20,
                  child: Column(
                    children: [
                      SafeArea(
                        child: Text(
                          'Your pick of ride low price',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(0, -height * 0.12),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: FormPreference(openResultScreen: true,)),
              
            ),
          ],
        ),
      ),
    );
  }
}
