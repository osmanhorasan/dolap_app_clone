// --- Ürün Bilgi ve Özellikler ---
import 'dart:math';

import 'package:dolap_app_clone/ui/favorite_button.dart';
import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailInfoSection extends StatefulWidget {
  final ProductModel product;
  const DetailInfoSection({required this.product, super.key});

  @override
  State<DetailInfoSection> createState() => _DetailInfoSectionState();
}

class _DetailInfoSectionState extends State<DetailInfoSection> {
  bool _isFreeAdded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ürün başlığı ve favori ikonu
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title ?? "Ürün Başlığı",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.product.brand ?? "Marka"} ${widget.product.category ?? ""}",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            FavoriteButton(isActive: true, isTitle: true),
          ],
        ),
        SizedBox(height: 8),
        // Ürün durumu ve renk
        Row(
          children: [
            Text(
              "Yeni, Defosuz",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 8),
            Icon(Icons.circle, color: Colors.amber, size: 16),
            SizedBox(width: 4),
            Text("Altın"),
          ],
        ),
        SizedBox(height: 8),
        // Açıklama
        Text(
          widget.product.description ?? "Ürün açıklaması",
          style: TextStyle(fontSize: 15, color: Colors.grey[800]),
        ),
        SizedBox(height: 10),
        // Ürün özellikleri kutucukları
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFE0FBF3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Materyal",
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text("Polyester", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFE0FBF3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Desen",
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text("Düz Renk", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFE0FBF3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Boyut",
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    (widget.product.dimensions != null &&
                            widget.product.dimensions!.width != null)
                        ? "${widget.product.dimensions!.width} x ${widget.product.dimensions!.height} x ${widget.product.dimensions!.depth}"
                        : "Orta",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        // Detaylı bilgi butonu
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(child: Text("Kolay iade hakkı! Detaylı bilgi")),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
        // Reklam/banner alanı
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(child: Text("Bu ürünü bedava almak ister misin?")),
              ElevatedButton(
                onPressed: _isFreeAdded
                    ? null
                    : () {
                        setState(() {
                          _isFreeAdded = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Ürün ücretsiz Sepete Eklendi"),
                          ),
                        );
                      },
                child: Text(
                  _isFreeAdded ? "Ücretsiz Sepete Eklendi" : "Hemen Başla",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
