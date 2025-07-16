import 'dart:async';
import 'package:flutter/material.dart';

class FavoriteBanner extends StatefulWidget {
  const FavoriteBanner({super.key});

  @override
  State<FavoriteBanner> createState() => _FavoriteBannerState();
}

class _FavoriteBannerState extends State<FavoriteBanner> {
  Duration duration = const Duration(hours: 88, minutes: 44, seconds: 25);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds > 0) {
        setState(() {
          duration = duration - const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get hours => duration.inHours.toString().padLeft(2, '0');
  String get minutes => (duration.inMinutes % 60).toString().padLeft(2, '0');
  String get seconds => (duration.inSeconds % 60).toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE3C6FF), Color(0xFFB2E0FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sana Özel Kupon Fırsatı!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Dikeyde ortalama
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text.rich(
                        TextSpan(
                          text: 'Tüm ürünlerde geçerli alt limitsiz ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: '%80 indirim!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Kupon süresi dolmadan hemen kullan!',
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                // Sayaç
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _TimerBox(text: hours),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepPurple,
                      ),
                    ),
                    _TimerBox(text: minutes),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepPurple,
                      ),
                    ),
                    _TimerBox(text: seconds),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimerBox extends StatelessWidget {
  final String text;
  const _TimerBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple.shade100),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
