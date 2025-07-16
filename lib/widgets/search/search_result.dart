import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final ProductModel data;

  const SearchResult({super.key, required this.data});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/detail",
          arguments: {"id": widget.data.id},
        );
      },
      title: Text(widget.data.title ?? ""),
      trailing: Text(widget.data.category ?? ""),
    );
  }
}
