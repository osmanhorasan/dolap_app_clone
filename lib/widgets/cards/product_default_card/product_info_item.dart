import 'package:flutter/material.dart';

class ProductInfoItem extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String text;
  const ProductInfoItem({
    super.key,
    required this.icon,
    this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        constraints: BoxConstraints(minWidth: 48, minHeight: 64),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: iconColor),
            Text(
              text,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
