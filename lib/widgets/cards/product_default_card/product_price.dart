import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final double discount;
  final double discountedPrice;
  const ProductPrice({
    super.key,
    required this.price,
    required this.discount,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          if (discount > 0)
            Text(
              price.toStringAsFixed(2) + "₺",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          if (discount > 0) SizedBox(width: 5),
          Text(
            discountedPrice.toStringAsFixed(2) + "₺",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff08E1A1),
            ),
          ),
        ],
      ),
    );
  }
}
