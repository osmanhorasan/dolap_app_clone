// --- Soru & Cevap Bölümü ---
import 'package:flutter/material.dart';

class DetailQuestionAnswerSection extends StatelessWidget {
  const DetailQuestionAnswerSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Soru & Cevap",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        // ... diğer Soru & Cevap kodları ...
      ],
    );
  }
}
