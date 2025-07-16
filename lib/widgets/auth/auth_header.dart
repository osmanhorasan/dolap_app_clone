import 'package:dolap_app_clone/widgets/auth/auth_banner.dart';
import 'package:dolap_app_clone/widgets/logo.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 64),
      child: Column(children: [Logo(), AuthBanner()]),
    );
  }
}
