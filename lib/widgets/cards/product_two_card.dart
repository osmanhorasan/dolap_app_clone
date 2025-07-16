import 'package:dolap_app_clone/ui/favorite_button.dart';
import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTwoCard extends StatefulWidget {
  ProductModel data;
  ProductTwoCard({super.key, required this.data});

  @override
  State<ProductTwoCard> createState() => _ProductTwoCardState();
}

class _ProductTwoCardState extends State<ProductTwoCard> {
  bool isFavorite = false;
  int? favoriteCount;

  @override
  void initState() {
    super.initState();
    // minimumOrderQuantity favori sayısı gibi kullanılacak
    favoriteCount = widget.data.minimumOrderQuantity ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    // İndirimli fiyat hesaplama
    double price = widget.data.price ?? 0;
    double discount = widget.data.discountPercentage ?? 0;
    double discountedPrice = price - (price * discount / 100);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/detail",
          arguments: {"id": widget.data.id},
        );
      },
      child: Container(
        width: 180,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ürün görseli + beğeni
            Container(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: Colors.grey.shade100,
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.data.images != null &&
                                  widget.data.images!.isNotEmpty
                              ? widget.data.images![0]
                              : (widget.data.thumbnail ?? 'default.png'),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),

                      child: FavoriteButton(
                        isActive: true,
                        isTitle: true,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Süper Fiyat etiketi (sadece %50 ve üzeri indirimde)
            if (discount >= 10)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flash_on, color: Colors.blue, size: 12),
                    SizedBox(width: 4),
                    Text(
                      "Süper Fiyat",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            // Başlık
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                widget.data.title ?? '',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            // Alt kısım: indirim kutusu ve fiyatlar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Sana Özel
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Sana\nÖzel",
                      style: TextStyle(
                        color: Colors.pink.shade600,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  // İndirim yüzdesi
                  if (discount > 0)
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.discount, size: 14),
                                Text(
                                  "%${discount.toStringAsFixed(0)}  İNDİRİM",
                                  style: TextStyle(
                                    color: Colors.pink.shade600,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (discount > 0)
                                  Text(
                                    price.toStringAsFixed(0) + "₺",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                if (discount > 0) SizedBox(width: 4),
                                // Yeni fiyat
                                Text(
                                  discountedPrice.toStringAsFixed(2) + "₺",
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Eski fiyat
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
