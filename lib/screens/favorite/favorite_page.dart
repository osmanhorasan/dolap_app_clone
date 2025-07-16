import 'package:dolap_app_clone/ui/cards/default_card_gridview.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/bottom_bar_main.dart';
import 'package:dolap_app_clone/widgets/cards/product_default_card.dart';
import 'package:dolap_app_clone/widgets/favorite/favorite_tap_bar.dart';
import 'package:dolap_app_clone/widgets/home/home_tap_bar.dart';
import 'package:dolap_app_clone/widgets/search/search_input.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Favorilerim",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.notifications_outlined),
                  ],
                ),
              ),
            ),
            Expanded(flex: 11, child: FavoriteTapBar()),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarMain(selectedIndex: 1),
    );
  }
}
