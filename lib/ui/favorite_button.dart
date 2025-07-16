import 'dart:math';

import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  bool isTitle;
  bool isActive;
  Color color;
  bool isPress;
  FavoriteButton({
    super.key,
    this.isTitle = true,
    this.isActive = false,
    this.color = Colors.black87,
    this.isPress = false,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  int favCount = Random().nextInt(500);
  Widget build(BuildContext context) {
    return widget.isActive
        ? SizedBox(
            height: widget.isTitle ? 70 : 50,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.isPress && favCount >= 1) {
                        favCount--;
                      } else {
                        favCount++;
                      }
                      widget.isPress = !widget.isPress;
                    });
                  },
                  icon: Icon(
                    (widget.isPress) ? Icons.favorite : Icons.favorite_outline,
                    color: (widget.isPress) ? Colors.redAccent : widget.color,
                  ),
                ),
                widget.isTitle
                    ? Text(
                        favCount.toString(),
                        style: TextStyle(color: widget.color),
                      )
                    : SizedBox(),
              ],
            ),
          )
        : SizedBox();
  }
}
