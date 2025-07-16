import 'package:dolap_app_clone/ui/cards/default_card.dart';
import 'package:dolap_app_clone/ui/cards/default_card_gridview.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/cards/product_default_card.dart';
import 'package:dolap_app_clone/widgets/favorite/favorite_banner.dart';
import 'package:dolap_app_clone/widgets/favorite/favorite_filter.dart';
import 'package:flutter/material.dart';

class FavoriteTabContentOne extends StatelessWidget {
  FavoriteTabContentOne({super.key});
  final APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10),
        FavoriteBanner(),
        FavoriteFilter(),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: apiService.getProducts("limit=3&skip=1"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.products != null &&
                        snapshot.data!.products!.isNotEmpty) {
                      return SizedBox(
                        height: 500, // Burada yüksekliği belirle
                        child: DefaultCardGridView(
                          item: (data) => ProductDefaultCard(data: data),
                          data: snapshot.data!.products!,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      );
                    } else {
                      return Text("Ürün bulunamadı.");
                    }
                  },
                ),
                SizedBox(height: 30),

                FutureBuilder(
                  future: apiService.getProducts("sortBy=title&order=desc"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.products != null &&
                        snapshot.data!.products!.isNotEmpty) {
                      return DefaultCard(
                        height: 375,
                        item: (data) =>
                            ProductDefaultCard(data: data, isBorder: false),
                        data: snapshot.data!.products!,
                        title: Text(
                          "Begene Bilecegin Ürünler",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      );
                    } else {
                      return Text("Ürün bulunamadı.");
                    }
                  },
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
