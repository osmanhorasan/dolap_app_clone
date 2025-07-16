import 'package:dolap_app_clone/widgets/auth/login/auth_login_form.dart';
import 'package:flutter/material.dart';

class AuthLogin extends StatelessWidget {
  const AuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title: Text("Giriş Yap"),
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),

        backgroundColor: Color(0xffFAFAFA),
      ),
      body: SingleChildScrollView(child: Column(children: [AuthLoginForm()])),
    );
  }
}
