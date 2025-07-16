import 'package:flutter/material.dart';

class ProductBrandCategoryBar extends StatelessWidget {
  final String brand;
  final String category;
  const ProductBrandCategoryBar({
    super.key,
    required this.brand,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Text(
        "$brand - $category",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
