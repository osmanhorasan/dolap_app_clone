import 'package:dolap_app_clone/ui/cards/default_card_gridview.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/cards/product_default_card.dart';
import 'package:dolap_app_clone/widgets/home/home_banner.dart';
import 'package:flutter/material.dart';

class HomeTabContentOne extends StatelessWidget {
  HomeTabContentOne({super.key});
  final APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return // 1. sekme içeriği
    Column(
      children: [
        SizedBox(height: 10),
        HomeBanner(),
        SizedBox(height: 20),
        Expanded(
          child: FutureBuilder(
            future: apiService.getProducts("limit=194&skip=0"),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.products != null &&
                  snapshot.data!.products!.isNotEmpty) {
                return DefaultCardGridView(
                  title: Text(
                    "Senin için seçtiklerimiz",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  item: (data) => ProductDefaultCard(data: data),
                  data: snapshot.data!.products!,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                );
              } else {
                return Text("Ürün bulunamadı.");
              }
            },
          ),
        ),
      ],
    );
  }
}
