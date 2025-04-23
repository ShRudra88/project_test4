import 'package:flutter/material.dart';
import 'package:project_test4/views/widgets/loading_shimmer.dart';
import 'package:project_test4/views/widgets/product_card.dart';
import '../controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🛍️ Products')),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryChips(),
          Expanded(
            child: Obx(() => controller.isLoading.value
                ? LoadingShimmer()
                : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.products.length,
              itemBuilder: (_, i) => ProductCard(product: controller.products[i]),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search product...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: const Icon(Icons.search),
        ),
        onSubmitted: controller.search,
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Obx(() => SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: controller.categories
            .map((cat) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ActionChip(
            label: Text(cat),
            onPressed: () => controller.filterByCategory(cat),
          ),
        ))
            .toList(),
      ),
    ));
  }
}
