import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var searchQuery = ''.obs;
  var selectedCategory = ''.obs;
  var categories = <String>[].obs;

  @override
  void onInit() {
    fetchCategories();
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading(true);
    final url = searchQuery.value.isNotEmpty
        ? 'https://dummyjson.com/products/search?q=${searchQuery.value}'
        : selectedCategory.value.isNotEmpty
        ? 'https://dummyjson.com/products/category/${selectedCategory.value}'
        : 'https://dummyjson.com/products?limit=100';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    products.value = List<Product>.from(
        data['products'].map((item) => Product.fromJson(item)));
    isLoading(false);
  }

  Future<void> fetchCategories() async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    final data = json.decode(response.body);
    categories.value = List<String>.from(data);
  }

  void search(String query) {
    searchQuery.value = query;
    fetchProducts();
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    fetchProducts();
  }
}
