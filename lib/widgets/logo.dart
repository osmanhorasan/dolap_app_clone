import 'package:flutter/material.dart'; // İçeri aktarmak için Flutter Material paketini kullanır

class Logo extends StatelessWidget {
  // Logo widget
  const Logo({super.key}); // Constructor Logo widget için

  @override // Widget build metodu, widget'ın nasıl görüneceğini tanımlar
  Widget build(BuildContext context) {
    // Logo widgetini oluşturur
    return Row(
      // Logo widgetini Row içinde kullanarak ortalar
      mainAxisAlignment: MainAxisAlignment.center, // Logo Ortolamak için
      children: [
        Container(
          padding: EdgeInsets.all(12), // Logo etrafına boşluk eklemek için
          width: 128, // Logo genişliği
          height: 64, // Logo yüksekliği
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ), // Logo resmi
          ),
        ),
      ],
    );
  }
}
