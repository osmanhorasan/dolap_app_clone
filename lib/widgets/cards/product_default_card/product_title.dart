import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
