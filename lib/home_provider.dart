import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeProvider extends ChangeNotifier
{
  double? long,lat;
  List p1 = [];

  void getlocation()async
  {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    long = position.longitude;
    lat = position.latitude;


    List Livelocation = await placemarkFromCoordinates(long!, lat!);
    p1 = Livelocation;
    notifyListeners();
  }
}