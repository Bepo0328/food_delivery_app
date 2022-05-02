import 'dart:convert';
import 'package:food_delivery_app/data/repository/repository.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    update();

    http.Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    // debugPrint('headers: ${response.headers}');
    // debugPrint('phrase: ${response.reasonPhrase}');
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      _userModel = UserModel.fromJson(responseBody);
      responseModel = ResponseModel(true, 'successfully');
    } else {
      responseModel = ResponseModel(false, response.reasonPhrase.toString());
    }
    _isLoading = false;
    update();

    return responseModel;
  }
}
