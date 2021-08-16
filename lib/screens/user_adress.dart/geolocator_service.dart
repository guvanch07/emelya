import 'package:emelya/screens/user_adress.dart/search_street.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();

  // veriables

  var currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }
  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }
}

class ApplicationBloc1 with ChangeNotifier {
  final placesService = PlacesService();

  // veriables
  var searchResults;

  void searchPlaces(String searchTeam) async {
    searchResults = await placesService.getAutocomplete(searchTeam);
    notifyListeners();
  }
}
