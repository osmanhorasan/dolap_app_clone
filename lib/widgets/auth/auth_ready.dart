import 'package:dolap_app_clone/widgets/auth/auth_facebook_button.dart';
import 'package:dolap_app_clone/widgets/auth/auth_google_button.dart';
import 'package:dolap_app_clone/widgets/auth/auth_or.dart';
import 'package:dolap_app_clone/widgets/auth/auth_trendyol_button.dart';
import 'package:flutter/material.dart';

class AuthReady extends StatelessWidget {
  final String type; // or "LOGIN" based on your logic
  const AuthReady({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthOr(
          text: Text("veya", style: TextStyle(color: Colors.grey.shade400)),
        ),
        AuthTrendyolButton(
          isTitle: true,
          isIcon: true,
          type: type, // or "LOGIN" based on your logic
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: AuthFacebookButton(
                isTitle: false,
                isIcon: true,
                type: type,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: AuthGoogleButton(isTitle: false, isIcon: true, type: type),
            ),
          ],
        ),
      ],
    );
  }
}
