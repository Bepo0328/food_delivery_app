import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<http.Response> getAddressFromGeocode(LatLng latlnt) async {
    return await apiClient.getData('${AppConstants.GEOCODE_URI}'
        '?lat=${latlnt.latitude}&lng=${latlnt.longitude}');
  }
}
