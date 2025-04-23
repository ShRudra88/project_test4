import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var categories = <String>[].obs;
  var isLoading = false.obs;
  var selectedCategory = ''.obs;
  var originalProducts = <Product>[];

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
  }

  void fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/categories'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        categories.assignAll(data.cast<String>());
      } else {
        Get.snackbar('Error', 'Failed to load categories');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<Product> fetchedProducts = (data['products'] as List)
            .map((e) => Product.fromJson(e))
            .toList();
        products.assignAll(fetchedProducts);
        originalProducts = List.from(fetchedProducts);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products: $e');
    } finally {
      isLoading(false);
    }
  }

  void filterByCategory(String category) async {
    if (category.isEmpty) {
      products.assignAll(originalProducts);
      selectedCategory('');
      return;
    }

    try {
      isLoading(true);
      selectedCategory(category);
      final response = await http.get(Uri.parse('https://dummyjson.com/products/category/$category'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        products.assignAll((data['products'] as List)
            .map((e) => Product.fromJson(e))
            .toList());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to filter by category: $e');
    } finally {
      isLoading(false);
    }
  }

  void search(String query) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://dummyjson.com/products/search?q=$query'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        products.assignAll((data['products'] as List)
            .map((e) => Product.fromJson(e))
            .toList());
      }
    } catch (e) {
      Get.snackbar('Error', 'Search failed: $e');
    } finally {
      isLoading(false);
    }
  }
}
