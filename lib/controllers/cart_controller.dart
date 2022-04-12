import 'package:food_delivery_app/data/repository/repository.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({
    required this.cartRepo,
  });

  final Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(
      product.id!,
      () => CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExit: true,
        time: DateTime.now().toString(),
      ),
    );
  }
}
