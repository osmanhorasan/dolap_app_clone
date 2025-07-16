// --- Satıcı Kartı ---
import 'package:flutter/material.dart';

class DetailSellerCard extends StatefulWidget {
  const DetailSellerCard({super.key});

  @override
  State<DetailSellerCard> createState() => _DetailSellerCardState();
}

class _DetailSellerCardState extends State<DetailSellerCard> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://randomuser.me/api/portraits/women/44.jpg", // örnek profil fotoğrafı
            ),
            radius: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jonh Doe", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text("5.0 (52)"),
                    SizedBox(width: 8),
                    Text(
                      "Süper Satıcı",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "44 dakika önce aktifti",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!isFollowed) {
                setState(() {
                  isFollowed = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Takip edildi'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: Text(isFollowed ? "Dolab'a Git" : "Takip Et"),
            style: ElevatedButton.styleFrom(
              backgroundColor: isFollowed ? Colors.white : Colors.green,
              foregroundColor: isFollowed ? Colors.green : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
