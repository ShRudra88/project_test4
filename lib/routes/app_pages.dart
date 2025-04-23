import 'package:get/get.dart';
import '../bindings/product_binding.dart';
import '../views/product_details_view.dart';
import '../views/product_list_view.dart';
import '../views/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => SplashView()),
    GetPage(
      name: '/home',
      page: () => ProductListView(),
      binding: ProductBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 800),
    ),
    GetPage(name: '/details', page: () => ProductDetailsView()),
  ];
}
