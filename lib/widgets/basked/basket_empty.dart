import 'package:flutter/material.dart';

class BasketEmpty extends StatelessWidget {
  const BasketEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Görsel veya icon
            SizedBox(
              height: 140,
              child: Image.asset(
                'assets/images/search_save.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.notifications_active,
                  size: 100,
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Sepetin Boş',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'Yüzlerce farklı kategoride milyonlarca ürün\nkeşfedilmek üzere seni bekliyor!\nŞimdi aramaya başla istediklerini sepetine\nekle.',
              style: TextStyle(fontSize: 15, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF27E1A9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Hemen Keşfet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
