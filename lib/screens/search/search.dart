import 'package:dolap_app_clone/ui/cards/default_card.dart';
import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:dolap_app_clone/utils/models/search_actions_model.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/cards/special_brand_for_you.dart';
import 'package:dolap_app_clone/widgets/cards/special_categories_for_you.dart';
import 'package:dolap_app_clone/widgets/cards/the_ones_you_visited_before.dart';
import 'package:dolap_app_clone/widgets/search/search_input.dart';
import 'package:dolap_app_clone/widgets/search/search_result.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<ProductModel> searchResults = [];
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),

      body: SafeArea(
        child: Column(
          children: [
            SearchInput(
              isBack: true,
              isReadOnly: false,

              onSearch: (String value) async {
                final result = await apiService.getProductsSearch('q= $value');
                setState(() {
                  if (value.isEmpty) {
                    searchResults = [];
                  } else {
                    searchResults = result.products!;
                  }
                });
              },
            ),

            searchResults.isEmpty
                ? Container()
                : Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return SearchResult(data: searchResults[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    searchResults.isEmpty
                        ? Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: FutureBuilder(
                                    future: apiService.getProducts(
                                      "limit=10&skip=0&sortBy=warrantyInformation&order=desc",
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data != null &&
                                          snapshot.data!.products != null &&
                                          snapshot.data!.products!.isNotEmpty) {
                                        return DefaultCard(
                                          item: (data) =>
                                              TheOnesYouVisitedBefore(
                                                data: data,
                                              ),
                                          data: snapshot.data!.products,
                                          title: Text(
                                            "Önceden Gezdiklerin",
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
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(height: 20),
                    searchResults.isEmpty
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: FutureBuilder(
                                  future: apiService.getProductsCategoryList(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != null &&
                                        snapshot.data!.categories != null &&
                                        snapshot.data!.categories!.isNotEmpty) {
                                      return DefaultCard(
                                        height: 72,
                                        item: (data) =>
                                            SpecialCategoriesForYou(data: data),
                                        data: snapshot.data!.categories,
                                        leading: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                            color: Colors.amberAccent,
                                          ),
                                          child: Icon(
                                            Icons.star_rate_sharp,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        title: Text(
                                          "Sana Özel Kategoriler",
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
                                        children: [CircularProgressIndicator()],
                                      );
                                    } else {
                                      return Text("Ürün bulunamadı.");
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(height: 20),
                    searchResults.isEmpty
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: FutureBuilder(
                                  future: apiService.getProducts(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != null &&
                                        snapshot.data!.products != null &&
                                        snapshot.data!.products!.isNotEmpty) {
                                      return DefaultCard(
                                        height: 100,
                                        item: (data) =>
                                            SpecialBrandForYou(data: data),
                                        data: snapshot.data!.products,

                                        title: Text(
                                          "Sana Özel Markalar",
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
                                        children: [CircularProgressIndicator()],
                                      );
                                    } else {
                                      return Text("Ürün bulunamadı.");
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
