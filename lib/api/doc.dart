import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:demo/model/product_model.dart';

class DocApi extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<List<Product>> getData() async {
    RxList<Product> productList = <Product>[].obs;

    String apiUrl = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Product> products =
            jsonData.map((data) => Product.fromJson(data)).toList();
        productList.assignAll(products);
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
      return productList;
    } catch (e) {
      print('Exception occurred: $e');
      throw e;
    }
  }
}
