import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchProductCard extends StatefulWidget {
  final ProductModel data;
  const SearchProductCard({super.key, required this.data});

  @override
  State<SearchProductCard> createState() => _SearchProductCardState();
}

class _SearchProductCardState extends State<SearchProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/detail",
          arguments: {"id": widget.data.id},
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.data.images![0]),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            widget.data.title!.length > 5
                ? widget.data.title!.substring(0, 5)
                : widget.data.title!,
          ),
        ],
      ),
    );
  }
}
