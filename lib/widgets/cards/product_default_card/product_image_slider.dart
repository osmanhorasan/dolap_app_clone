import 'package:dolap_app_clone/ui/favorite_button.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> images;
  const ProductImageSlider({super.key, required this.images});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          itemCount: widget.images.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: DecorationImage(
                  image: NetworkImage(widget.images[index]),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            );
          },
        ),
        Positioned(
          top: 0,
          right: 0,
          child: FavoriteButton(
            isActive: true,
            isTitle: true,
            isPress: false,
            color: Colors.white,
          ),
        ),
        if (widget.images.length > 1)
          Container(
            margin: EdgeInsets.all(5),
            width: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.black
                        : Colors.grey.shade200,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
