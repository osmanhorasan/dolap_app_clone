import 'package:flutter/material.dart';

class DetailBottomBar extends StatelessWidget {
  final double? oldPrice;
  final double? newPrice;
  final int? id;
  const DetailBottomBar({this.oldPrice, this.newPrice, super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Fiyat kısmı
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "Sana Özel",
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Column(
                children: [
                  if (oldPrice != null &&
                      newPrice != null &&
                      oldPrice != newPrice)
                    Text(
                      "${oldPrice!.toStringAsFixed(2)}₺",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  if (oldPrice != null &&
                      newPrice != null &&
                      oldPrice != newPrice)
                    SizedBox(width: 6),
                  Text(
                    "${(newPrice ?? oldPrice)?.toStringAsFixed(2) ?? ''}₺",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          // Teklif Ver butonu
          SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFF1ED7B5),
                side: BorderSide(color: Color(0xFF1ED7B5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text("Teklif Ver", style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(width: 8),
          // Sepete Ekle butonu
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Sepete eklendi'),
                    duration: Duration(seconds: 1),
                  ),
                );
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, "/basket", arguments: {"id": id});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1ED7B5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text("Sepete Ekle", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
