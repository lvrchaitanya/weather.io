import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {

  double lat,long;

  void GetCurrentocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat=position.latitude;
      long=position.longitude;
    }
    catch(e){
      print(e);
    }
  }


}
