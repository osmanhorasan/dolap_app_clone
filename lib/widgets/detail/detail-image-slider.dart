// --- Görsel Slider ---
import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  final List<String>? images;
  const DetailImageSlider({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.0,
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: PageView.builder(
          itemCount: images?.length ?? 0,
          itemBuilder: (context, index) {
            return Image.network(images![index], fit: BoxFit.contain);
          },
        ),
      ),
    );
  }
}
