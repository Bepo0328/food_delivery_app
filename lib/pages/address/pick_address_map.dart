import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;

  const PickAddressMap({
    Key? key,
    required this.fromSignup,
    required this.fromAddress,
    this.googleMapController,
  }) : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initalPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    super.initState();
    LocationController locationController = Get.find<LocationController>();
    if (locationController.addressList.isEmpty) {
      _initalPosition = const LatLng(
        37.57037778,
        126.9816417,
      );
      _cameraPosition = CameraPosition(
        target: _initalPosition,
        zoom: 17,
      );
    } else {
      if (locationController.addressList.isNotEmpty) {
        _initalPosition = LatLng(
          double.parse(locationController.getAddress['latitude']),
          double.parse(locationController.getAddress['longitude']),
        );
        _cameraPosition = CameraPosition(
          target: _initalPosition,
          zoom: 17,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _initalPosition,
                      zoom: 17,
                    ),
                    zoomControlsEnabled: false,
                    onCameraMove: (CameraPosition cameraPosition) {
                      _cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () {
                      locationController.updatePosition(
                        _cameraPosition,
                        false,
                      );
                    },
                    myLocationEnabled: true,
                  ),
                  Center(
                    child: locationController.loading
                        ? Image.asset(
                            'assets/image/pick_marker.png',
                            height: Dimenstions.height10 * 5,
                            width: Dimenstions.width10 * 5,
                          )
                        : const CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
