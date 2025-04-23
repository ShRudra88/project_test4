import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250, enlargeCenterPage: true),
              items: product.images
                  .map((url) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
              ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Text(product.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 5),
            Text("\$${product.price}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Rating: ${product.rating} ⭐"),
            const SizedBox(height: 10),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
