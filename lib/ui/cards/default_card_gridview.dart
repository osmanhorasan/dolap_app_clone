import 'package:flutter/material.dart';

class DefaultCardGridView extends StatefulWidget {
  final Text? title;
  final Text? subtitle;
  final Widget? Function(dynamic)? item;
  final Widget? leading;
  final Widget? trailing;
  final dynamic data;
  final double? height;
  final int? itemCount;
  final double? childAspectRatio;

  const DefaultCardGridView({
    super.key,
    this.title,
    this.subtitle,
    this.item,
    this.leading,
    this.trailing,
    this.height,
    this.itemCount,
    this.childAspectRatio,
    required this.data,
  });

  @override
  State<DefaultCardGridView> createState() => _DefaultCardGridViewState();
}

class _DefaultCardGridViewState extends State<DefaultCardGridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.leading ?? SizedBox(),
              widget.leading != null ? SizedBox(width: 10) : SizedBox(),
              widget.title ?? SizedBox(),

              Spacer(),
              widget.trailing ?? SizedBox(),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1 / 1.75,
            ),
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return widget.item != null
                  ? widget.item!(widget.data[index])
                  : SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
