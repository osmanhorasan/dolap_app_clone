import 'package:flutter/material.dart';

class AuthOr extends StatelessWidget {
  final Text text;
  const AuthOr({super.key, this.text = const Text("Ya da")});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            child: text,
          ),
          Expanded(child: Divider()),
        ],
      ),
    );
  }
}
