import 'package:flutter/material.dart';

class DefaultCard extends StatefulWidget {
  final Text? title;
  final Text? subtitle;
  final Widget? Function(dynamic)? item;
  final Widget? leading;
  final Widget? trailing;
  final dynamic data;
  final double? height;
  const DefaultCard({
    super.key,
    this.title,
    this.subtitle,
    this.item,
    this.leading,
    this.trailing,
    this.height,
    required this.data,
  });

  @override
  State<DefaultCard> createState() => _DefaultCardState();
}

class _DefaultCardState extends State<DefaultCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Başlık kısmı için Expanded kaldırıldı
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
        // ListView için yüksekliği belirliyoruz
        SizedBox(
          height:
              widget.height ?? 130, // Burayı istediğiniz yükseklikle değiştirin
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
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
