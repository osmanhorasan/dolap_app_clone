import 'package:dolap_app_clone/ui/cards/default_card.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/cards/product_two_card.dart';
import 'package:dolap_app_clone/widgets/home/home_banner.dart';
import 'package:flutter/material.dart';

class HomeTabContentTwo extends StatelessWidget {
  HomeTabContentTwo({super.key});
  final APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return // 1. sekme içeriği
    /* İkinci Tab */
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          HomeBanner(),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: FutureBuilder(
                    future: apiService.getProducts("sortBy=title&order=desc"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data!.products != null &&
                          snapshot.data!.products!.isNotEmpty) {
                        return DefaultCard(
                          height: 300,
                          item: (data) => ProductTwoCard(data: data),
                          data: snapshot.data!.products!,
                          title: Text(
                            "Sana Özel Kampanyalı Ürünler",
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
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: FutureBuilder(
                        future: apiService.getProducts(
                          "sortBy=price&order=asc",
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data != null &&
                              snapshot.data!.products != null &&
                              snapshot.data!.products!.isNotEmpty) {
                            return DefaultCard(
                              height: 300,
                              item: (data) => ProductTwoCard(data: data),
                              data: snapshot.data!.products!,
                              title: Text(
                                "Sana Özel Yeni Ürünler",
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
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: FutureBuilder(
                        future: apiService.getProducts(
                          "sortBy=rating&order=desc",
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data != null &&
                              snapshot.data!.products != null &&
                              snapshot.data!.products!.isNotEmpty) {
                            return DefaultCard(
                              height: 300,
                              item: (data) => ProductTwoCard(data: data),
                              data: snapshot.data!.products!,
                              title: Text(
                                "Tam Senlik Sezon Ürünleri",
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
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: FutureBuilder(
                        future: apiService.getProducts(
                          "sortBy=minimumOrderQuantity&order=asc",
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data != null &&
                              snapshot.data!.products != null &&
                              snapshot.data!.products!.isNotEmpty) {
                            return DefaultCard(
                              height: 300,
                              item: (data) => ProductTwoCard(data: data),
                              data: snapshot.data!.products!,
                              title: Text(
                                "Alıcıların İlk Favorileri",
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
