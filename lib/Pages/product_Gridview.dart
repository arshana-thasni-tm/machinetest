import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/Pages/productDetailPages.dart';

import '../controller/productController.dart';


class GridPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove the title from the AppBar
        title: SizedBox.shrink(),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.products.isEmpty) {
          return Center(child: Text('No products found'));
        } else {
          return GridView.builder(
            padding: EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 8.0, // Space between columns
              mainAxisSpacing: 8.0, // Space between rows
              childAspectRatio: 1.0, // Aspect ratio of each grid item
            ),
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              final product = productController.products[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailPage(
                    imageUrl: 'https://mansharcart.com/image/${product.imageUrl}',
                  ));
                },
                child: Card(
                  elevation: 4.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    child: Image.network(
                      'https://mansharcart.com/image/${product.imageUrl}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
