import 'package:dolap_app_clone/ui/auth/auth_button.dart';
import 'package:flutter/material.dart';

class SpecialCategoriesForYou extends StatefulWidget {
  final String data;
  const SpecialCategoriesForYou({super.key, required this.data});

  @override
  State<SpecialCategoriesForYou> createState() =>
      _SpecialCategoriesForYouState();
}

class _SpecialCategoriesForYouState extends State<SpecialCategoriesForYou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: AuthButton(
        title: Text(widget.data),
        onPressed: () {
          Navigator.pushNamed(context, "/home");
        },
      ),
    );
  }
}
