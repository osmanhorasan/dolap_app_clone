import 'package:dolap_app_clone/ui/cards/default_card.dart';
import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:dolap_app_clone/utils/models/search_actions_model.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/cards/product_two_card.dart';
import 'package:dolap_app_clone/widgets/detail/detail-bottom-bar.dart';
import 'package:dolap_app_clone/widgets/detail/detail-image-slider.dart';
import 'package:dolap_app_clone/widgets/detail/detail-info-section.dart';
import 'package:dolap_app_clone/widgets/detail/detail-question-answer-section.dart';
import 'package:dolap_app_clone/widgets/detail/detail-seller-card.dart';
import 'package:dolap_app_clone/widgets/detail/detail-tags-section.dart';
import 'package:dolap_app_clone/widgets/detail/more-list-tile.dart';
import 'package:dolap_app_clone/widgets/search/search_input.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final id = args?["id"];
    APIService apiService = APIService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: id != null ? apiService.getProductById(id) : Future.value(null),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data != null) {
            final product = snapshot.data!;
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  // Scrollable içerik
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                    ), // Arama çubuğu yüksekliği kadar boşluk
                    child: CustomScrollView(
                      slivers: [
                        DetailImageSlider(images: product.images),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DetailInfoSection(product: product),
                                SizedBox(height: 16),
                                DetailSellerCard(),
                                SizedBox(height: 16),
                                DetailTagsSection(),
                                SizedBox(height: 24),
                                DetailQuestionAnswerSection(),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: FutureBuilder(
                                    future: apiService.getProducts(
                                      "sortBy=title&order=desc",
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data != null &&
                                          snapshot.data!.products != null &&
                                          snapshot.data!.products!.isNotEmpty) {
                                        return DefaultCard(
                                          height: 300,
                                          item: (data) =>
                                              ProductTwoCard(data: data),
                                          data: snapshot.data!.products!,
                                          title: Text(
                                            "Bunu Begenenler Bunlarıda Beğendi",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                          ],
                                        );
                                      } else {
                                        return Text("Ürün bulunamadı.");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
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
                                          item: (data) =>
                                              ProductTwoCard(data: data),
                                          data: snapshot.data!.products!,
                                          title: Text(
                                            "Benze Ürünler",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                          ],
                                        );
                                      } else {
                                        return Text("Ürün bulunamadı.");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    MoreListTile(title: "Dafa Fazla Diğer"),
                                    MoreListTile(
                                      title: "Daha Fazla Omuz Çantası",
                                    ),
                                    MoreListTile(
                                      title: "Daha Fazla Diger Ürünler",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Sabit SearchInput en üstte
                  Container(
                    color: Colors.white,

                    child: SafeArea(
                      child: SearchInput(
                        isReadOnly: true,
                        isBack: true,
                        isActions: SearchActionsModel(
                          isSearch: false,
                          isNotification: false,
                          isFavorite: true,
                          isShare: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: DetailBottomBar(
                oldPrice: product.price,
                id: product.id,
                newPrice:
                    product.discountPercentage != null &&
                        product.discountPercentage! > 0
                    ? (product.price != null
                          ? (product.price! *
                                (1 - product.discountPercentage! / 100))
                          : null)
                    : product.price,
              ),
            );
          } else {
            return Center(child: Text("Ürün bulunamadı veya id eksik."));
          }
        },
      ),
    );
  }
}
