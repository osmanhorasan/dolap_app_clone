import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';

class TheOnesYouVisitedBefore extends StatefulWidget {
  final ProductModel data;
  const TheOnesYouVisitedBefore({super.key, required this.data});

  @override
  State<TheOnesYouVisitedBefore> createState() =>
      _TheOnesYouVisitedBeforeState();
}

class _TheOnesYouVisitedBeforeState extends State<TheOnesYouVisitedBefore> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/detail",
          arguments: {"id": widget.data.id},
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 90,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage("${widget.data.images![0]}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
