import 'package:get/get.dart';
import '../bindings/product_binding.dart';
import '../views/product_details_view.dart';
import '../views/product_list_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => ProductListView(), binding: ProductBinding()),
    GetPage(name: '/details', page: () => ProductDetailsView()),
  ];
}
