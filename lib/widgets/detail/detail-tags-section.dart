// --- Alıcılar Ne Diyor Kutucukları ---
import 'dart:math';

import 'package:flutter/material.dart';

class DetailTagsSection extends StatelessWidget {
  const DetailTagsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alıcılar Ne Diyor?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _customTagBox("${Random().nextInt(20) + 2} | Temiz Ürün"),
              SizedBox(width: 8),
              _customTagBox("${Random().nextInt(20) + 2} | Orijinal Ürün"),
              SizedBox(width: 8),
              _customTagBox("${Random().nextInt(20) + 2} | İyi Fiyat"),
              SizedBox(width: 8),
              _customTagBox("${Random().nextInt(20) + 2} | Satıcı İlgili"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _customTagBox(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey[800], fontSize: 14),
      ),
    );
  }
}
