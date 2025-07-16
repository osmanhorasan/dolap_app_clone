import 'package:dolap_app_clone/widgets/auth/auth_buttons.dart';
import 'package:dolap_app_clone/widgets/auth/auth_header.dart';
import 'package:flutter/material.dart';

class AuthMain extends StatefulWidget {
  const AuthMain({super.key});

  @override
  State<AuthMain> createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [AuthHeader(), AuthButtons()]),
      ),
    );
  }
}
