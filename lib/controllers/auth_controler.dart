import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(SignUpBody signUpBody) async {
    _isLoading = true;
    http.Response response = await authRepo.registration(signUpBody);
    if (response.statusCode == 200) {
    } else {}
  }
}
