import 'package:flutter/material.dart';
import 'product_info_item.dart';

class ProductInfoRow extends StatelessWidget {
  final String shippingInformation;
  final double discount;
  final String availabilityStatus;
  const ProductInfoRow({
    super.key,
    required this.shippingInformation,
    required this.discount,
    required this.availabilityStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductInfoItem(icon: Icons.person, text: "Süper Satıcı"),
        SizedBox(width: 5),
        ProductInfoItem(
          icon: Icons.fire_truck,
          iconColor: Colors.purple,
          text: shippingInformation.isNotEmpty
              ? shippingInformation
              : "Kargo Bedava",
        ),
        SizedBox(width: 5),
        ProductInfoItem(
          icon: Icons.discount,
          iconColor: Color(0xff08E1A1),
          text: discount > 0
              ? "%${discount.toStringAsFixed(0)} indirim"
              : "%80'e varan",
        ),
        SizedBox(width: 5),
        ProductInfoItem(
          icon: Icons.notifications,
          iconColor: Colors.orange,
          text: availabilityStatus.isNotEmpty
              ? availabilityStatus
              : "Yeni Geldi",
        ),
      ],
    );
  }
}
