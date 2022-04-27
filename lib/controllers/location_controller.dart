// ignore_for_file: unused_field

import 'package:food_delivery_app/data/repository/repository.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({
    required this.locationRepo,
  });

  late Position _position;
  late Position _pickPosition;

  final Placemark _placemark = Placemark();
  final Placemark _pickPlacemark = Placemark();

  final List<AddressModel> _addressList = [];
  late List<AddressModel> _allAddressList;

  final List<String> _addressTypeList = ['home', 'office', 'others'];
  final int _addressTypeIndex = 0;
}
