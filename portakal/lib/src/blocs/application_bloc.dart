import 'package:flutter/cupertino.dart';
import 'package:flutter_login_signup/src/models/place_search.dart';
import 'package:flutter_login_signup/src/services/geolocator_service.dart';
import 'package:flutter_login_signup/src/services/places_service.dart';
import 'package:geolocator/geolocator.dart';


class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeoLocatorService();
  final placesService= PlacesService();


  ApplicationBloc() {
    setCurrentLocation();
  }

  //Değişkenler
  var currentLocation;
  List<PlaceSearch>? searchResults = null;

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async{
   searchResults=await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

}