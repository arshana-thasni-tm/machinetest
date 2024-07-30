import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/Pages/productDetailPages.dart';


class GridPage extends StatelessWidget {
  // Static list of image URLs
  final List<String> imageUrls = List.generate(
    20,
        (index) => 'https://picsum.photos/200/300?random=$index',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove the title from the AppBar
        title: SizedBox.shrink(),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Space between columns
          mainAxisSpacing: 8.0, // Space between rows
          childAspectRatio: 1.0, // Aspect ratio of each grid item
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final imageUrl = imageUrls[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailPage(
                imageUrl: imageUrl,
              ));
            },
            child: Card(
              elevation: 4.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
