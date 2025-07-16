import 'dart:math';

import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/search/search_accordion_menu.dart';
import 'package:dolap_app_clone/widgets/search/search_input.dart';
import 'package:flutter/material.dart';

class SearchCategoriesPage extends StatefulWidget {
  const SearchCategoriesPage({super.key});

  @override
  State<SearchCategoriesPage> createState() => _SearchCategoriesPageState();
}

class _SearchCategoriesPageState extends State<SearchCategoriesPage> {
  int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SearchInput(isReadOnly: true),
            Expanded(
              flex: 15,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: FutureBuilder(
                      future: apiService.getProductsCategoryList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data!.categories.isNotEmpty) {
                          return ListView.builder(
                            itemCount: snapshot.data!.categories.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.grey.shade200,
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  height: 100,
                                  child: Text(
                                    snapshot.data!.categories[index],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
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

                  Expanded(
                    flex: 5,
                    child: SearchAccordionMenu(
                      key: UniqueKey(),
                      query: [
                        "sortBy=price&order=desc",
                        "sortBy=availabilityStatus&order=desc",
                        "sortBy=rating&order=desc",
                        "sortBy=brand&order=desc",
                        "sortBy=minimumOrderQuantity&order=desc",
                        "sortBy=stock&order=asc",
                      ],
                      titles: [
                        "Fiyatı Düşenler",
                        "Yeni Gelenler",
                        "Populerler",
                        "Markalar",
                        "En Çok Satanlar",
                        "Stok Az Olanlar",
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
