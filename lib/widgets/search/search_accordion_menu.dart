import 'package:dolap_app_clone/ui/cards/default_card_gridview.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/cards/search_product_card.dart';
import 'package:flutter/material.dart';

class SearchAccordionMenu extends StatefulWidget {
  final List<String> query;
  final List<String> titles;
  const SearchAccordionMenu({
    super.key,
    required this.query,
    required this.titles,
  });

  @override
  State<SearchAccordionMenu> createState() => _SearchAccordionMenuState();
}

class _SearchAccordionMenuState extends State<SearchAccordionMenu> {
  APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        elevation: 0,
        children: widget.titles.asMap().entries.map((entry) {
          int index = entry.key;
          String e = entry.value;
          return ExpansionPanelRadio(
            backgroundColor: Colors.white,
            canTapOnHeader: true,
            value: e,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(title: Text(e));
            },
            body: Expanded(
              child: SizedBox(
                height: 480,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: FutureBuilder(
                          future: apiService.getProducts(widget.query[index]),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.data != null &&
                                snapshot.data!.products != null &&
                                snapshot.data!.products!.isNotEmpty) {
                              return DefaultCardGridView(
                                itemCount: 3,
                                childAspectRatio: 1 / 1.5,

                                item: (data) => SearchProductCard(data: data),
                                data: snapshot.data!.products!,
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
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
