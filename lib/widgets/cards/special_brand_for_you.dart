import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';

class SpecialBrandForYou extends StatefulWidget {
  final ProductModel data;
  const SpecialBrandForYou({super.key, required this.data});

  @override
  State<SpecialBrandForYou> createState() => _SpecialBrandForYouState();
}

class _SpecialBrandForYouState extends State<SpecialBrandForYou> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/home");
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        width: 80,
        height: 100,
        child: Text(
          widget.data.brand!.substring(0, 2),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey.shade300, width: 2),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(widget.data.thumbnail ?? ""),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
      ),
    );
  }
}
