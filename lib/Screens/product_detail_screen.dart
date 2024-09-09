import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic data;
  const ProductDetailScreen({super.key, this.data});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.data["product_image"]), // Add your image asset here
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Product Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.data["product_name"],
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),

            // Product Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.data["product_price"].toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Product Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
               'Quantity: '+ widget.data["product_qty"].toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle add to cart action
                },
                style: ElevatedButton.styleFrom(
                  // primary: Colors.blue, // Background color
                  // onPrimary: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                child: const Text('Add to Cart'),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}