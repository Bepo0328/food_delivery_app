import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(
      37.57037778,
      126.9816417,
    ),
    zoom: 17,
  );
  LatLng _initialPosition = const LatLng(
    37.57037778,
    126.9816417,
  );

  @override
  void initState() {
    super.initState();
    getPermission();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    UserController userContoller = Get.find<UserController>();
    LocationController locationController = Get.find<LocationController>();
    if (_isLogged && userContoller.userModel == null) {
      userContoller.getUserInfo();
    }
    if (locationController.addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(locationController.getAddress['latitude']),
          double.parse(locationController.getAddress['longitude']),
        ),
      );
      _initialPosition = LatLng(
        double.parse(locationController.getAddress['latitude']),
        double.parse(locationController.getAddress['longitude']),
      );
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _contactPersonName.dispose();
    _contactPersonNumber.dispose();
    super.dispose();
  }

  Future<void> getPermission() async {
    Map<Permission, PermissionStatus> permissions = await [Permission.location].request();
    if (permissions[Permission.location]!.isGranted) {
      debugPrint('Permission Grandted');
    } else {
      debugPrint('Permission Denied');
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<LocationController>(builder: (_locationController) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: Dimenstions.height20 * 7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition,
                      zoom: 17,
                    ),
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    indoorViewEnabled: true,
                    mapToolbarEnabled: false,
                    onCameraIdle: () {
                      _locationController.updatePosition(_cameraPosition, true);
                    },
                    onCameraMove: ((position) => _cameraPosition = position),
                    onMapCreated: (GoogleMapController controller) {
                      _locationController.setMapController(controller);
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
