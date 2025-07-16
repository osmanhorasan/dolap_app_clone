import 'package:flutter/material.dart';

class AuthBanner extends StatelessWidget {
  const AuthBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Color(0xffE88A41)),
                  SizedBox(width: 8),
                  Text("Trendyol"),
                  SizedBox(width: 4),
                  Text(
                    "güvencesiyle",
                    style: TextStyle(color: Color(0xffE88A41)),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xff4D2F91),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.discount, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "%80 inidirim kaçmaz! Hemen giriş yap kazan.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
