import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';

class BasketItem extends StatelessWidget {
  final ProductModel product;
  final bool isSelected;
  final Function(bool) onSelected;

  const BasketItem({
    super.key,
    required this.product,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Checkbox(
                activeColor: StaticConstants.mainColor,
                value: isSelected,
                onChanged: (val) {
                  onSelected(val!);
                },
                shape: CircleBorder(),
              ),
              CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(product.images?[0] ?? ''),
              ),
              SizedBox(width: 8),
              Text(
                product.brand ?? "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: StaticConstants.mainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  product.rating.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        isSelected
            ? Container(
                width: double.infinity,
                color: Color(0xFFEDE7F6),
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_shipping,
                      color: Color(0xFF7C4DFF),
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Kargo Bedava',
                      style: TextStyle(
                        color: Color(0xFF7C4DFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
        Container(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.images?[0] ?? '',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Yeni & Etiketli',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "${product.price!.toStringAsFixed(2)}₺",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          product.discountPercentage != null &&
                                  product.discountPercentage! > 0
                              ? (product.price != null
                                    ? (product.price! *
                                              (1 -
                                                  product.discountPercentage! /
                                                      100))
                                          .toStringAsFixed(2)
                                    : "")
                              : (product.price != null
                                    ? product.price!.toStringAsFixed(2)
                                    : ""),
                          style: TextStyle(
                            color: StaticConstants.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.savings,
                          color: StaticConstants.mainColor,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Toplam Tasarrufun ',
                          style: TextStyle(
                            color: StaticConstants.mainColor,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          product.discountPercentage != null &&
                                  product.discountPercentage! > 0 &&
                                  product.price != null
                              ? "${(product.price! * product.discountPercentage! / 100).toStringAsFixed(2)} TL"
                              : "",
                          style: TextStyle(
                            color: StaticConstants.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.people, color: Color(0xFFFFC107), size: 18),
                        SizedBox(width: 4),
                        Text(
                          '2 kişinin sepetinde!',
                          style: TextStyle(
                            color: Color(0xFFFFC107),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.grey),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      backgroundColor: Colors.white,
                      content: Text(
                        "Ürünü sepetinden silmek istediğine emin misin?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/favorite");
                          },
                          child: Text(
                            "Sil ve Favorilere ekle",
                            style: TextStyle(color: StaticConstants.mainColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/favorite");
                          },
                          child: Text(
                            "Sil",
                            style: TextStyle(color: StaticConstants.mainColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: StaticConstants.mainColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            child: Text(
              'Toplu İndirim İste',
              style: TextStyle(
                color: StaticConstants.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
