// lib/controller/product_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/productModel.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://mansharcart.com/api/products/category/139/key/123456789'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var productList = (data['products'] as List)
            .map((product) => Product.fromJson(product))
            .toList();

        products.value = productList;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
