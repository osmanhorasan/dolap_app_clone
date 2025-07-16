import 'package:dolap_app_clone/widgets/auth/register/auth_register_form.dart';
import 'package:flutter/material.dart';

class AuthRegister extends StatelessWidget {
  const AuthRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title: Text("Üye Ol"),
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),

        backgroundColor: Color(0xffFAFAFA),
      ),
      body: SingleChildScrollView(
        child: Column(children: [AuthRegisterForm()]),
      ),
    );
  }
}
