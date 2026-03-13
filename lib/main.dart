import 'package:blablacarv2/service/location_service.dart';
import 'package:blablacarv2/ui/screen/home/ride_prefernce_screen.dart';
import 'package:blablacarv2/ui/viewmodel/form_view_model.dart';
import 'package:blablacarv2/ui/viewmodel/location_list_view_model.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  DevicePreview(
    builder: (context) => 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> FormViewModel()),
        ChangeNotifierProvider(create: (context)=> LocationListViewModel(service: LocationsService()))
      ],
    child: MyApp(),)
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blahblahblahCar',
      theme: ThemeData(fontFamily: 'Eesti'),
      home: RidePrefernceScreen(),
    );
  }
}
