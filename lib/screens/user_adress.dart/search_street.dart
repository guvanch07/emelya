import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlaceSearch {
  final String description;
  final String placeId;

  PlaceSearch({
    required this.description,
    required this.placeId,
  });

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
        description: json['description'], placeId: json['place_id']);
  }
}

class PlacesService {
  final key = 'AIzaSyD6qmOIeaem3JfYLcjRCqQ6q6w08kGKi2U';
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&language=ru_BY&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['predictions'] as List;
    return jsonResult.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
