import 'package:dolap_app_clone/ui/auth/auth_button.dart';
import 'package:dolap_app_clone/widgets/auth/auth_default_button.dart';
import 'package:dolap_app_clone/widgets/auth/auth_facebook_button.dart';
import 'package:dolap_app_clone/widgets/auth/auth_google_button.dart';
import 'package:dolap_app_clone/widgets/auth/auth_or.dart';
import 'package:dolap_app_clone/widgets/auth/auth_trendyol_button.dart';
import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          AuthDefaultButton(isTitle: true, isIcon: true, type: "LOGIN"),
          SizedBox(height: 20),
          AuthTrendyolButton(isTitle: true, isIcon: true, type: "LOGIN"),
          SizedBox(height: 20),
          AuthFacebookButton(isTitle: true, isIcon: true, type: "LOGIN"),
          SizedBox(height: 20),
          AuthGoogleButton(isTitle: true, isIcon: true, type: "LOGIN"),

          AuthOr(
            text: Text("ya da", style: TextStyle(color: Colors.grey.shade400)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: AuthButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth/register');
                    },
                    title: Text(
                      "Üye Ol",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff08E1A1),
                      foregroundColor: Color(0xffFAFAFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
