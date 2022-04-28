// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repository/repository.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({
    required this.locationRepo,
  });
  late Position _position;
  late Position _pickPosition;

  Position get position => _position;
  Position get pickPosition => _pickPosition;

  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();

  Placemark get placemark => _placemark;
  Placemark get pickPlacemark => _pickPlacemark;

  final List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;

  late List<AddressModel> _allAddressList;

  final List<String> _addressTypeList = ['home', 'office', 'others'];
  final int _addressTypeIndex = 0;

  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  late GoogleMapController _mapController;
  final bool _updateAddressData = true;
  final bool _changeAddress = true;

  bool _loading = false;
  bool get loading => _loading;

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();

      try {
        if (fromAddress) {
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        } else {
          _pickPosition = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        }

        if (_changeAddress) {
          String _address = await getAddressFromGeocode(
            LatLng(
              position.target.latitude,
              position.target.longitude,
            ),
          );
          fromAddress ? _placemark = Placemark(name: _address) : _pickPlacemark = Placemark(name: _address);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latlnt) async {
    String _address = 'Unknown Location Found';
    http.Response response = await locationRepo.getAddressFromGeocode(latlnt);
    // debugPrint('headers: ${response.headers}');
    // debugPrint('phrase: ${response.reasonPhrase}');
    var responseBody = jsonDecode(response.body);
    // debugPrint('responseBody: $responseBody');
    if (responseBody['status'] == 'OK') {
      _address = responseBody['results'][0]['formatted_address'].toString();
      debugPrint('printing address $_address');
    } else {
      debugPrint('Error getting the google api');
    }
    return _address;
  }
}
