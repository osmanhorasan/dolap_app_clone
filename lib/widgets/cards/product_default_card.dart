import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:flutter/material.dart';
import 'product_default_card/product_image_slider.dart';
import 'product_brand_category_bar.dart';
import 'product_default_card/product_title.dart';
import 'product_default_card/product_price.dart';
import 'product_default_card/product_info_row.dart';

class ProductDefaultCard extends StatefulWidget {
  ProductModel data;
  bool? isBorder;
  ProductDefaultCard({super.key, required this.data, this.isBorder});

  @override
  State<ProductDefaultCard> createState() => _ProductDefaultCardState();
}

class _ProductDefaultCardState extends State<ProductDefaultCard> {
  @override
  Widget build(BuildContext context) {
    double price = widget.data.price ?? 0;
    double discount = widget.data.discountPercentage ?? 0;
    double discountedPrice = price - (price * discount / 100);

    List<String> images =
        widget.data.images != null && widget.data.images!.isNotEmpty
        ? widget.data.images!
        : [widget.data.thumbnail ?? 'default.png'];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/detail",
          arguments: {"id": widget.data.id},
        );
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: 200),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: (widget.isBorder ?? true)
                ? Colors.grey.shade300
                : Colors.transparent,
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 4, child: ProductImageSlider(images: images)),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductBrandCategoryBar(
                    brand: widget.data.brand ?? '',
                    category: widget.data.category ?? '',
                  ),
                  ProductTitle(title: widget.data.title ?? ''),
                  ProductPrice(
                    price: price,
                    discount: discount,
                    discountedPrice: discountedPrice,
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ),

            ProductInfoRow(
              shippingInformation: widget.data.shippingInformation ?? '',
              discount: discount,
              availabilityStatus: widget.data.availabilityStatus ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
