import 'package:dolap_app_clone/widgets/favorite/favorite_tab_content_one.dart';
import 'package:dolap_app_clone/widgets/favorite/favorite_tab_content_two.dart';
import 'package:flutter/material.dart';

class FavoriteTapBar extends StatelessWidget {
  const FavoriteTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: 44, // TabBar yüksekliği
            child: TabBar(
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xff08E1A1), width: 3),
                ),
              ),
              labelColor: Color(0xff08E1A1),
              unselectedLabelColor: Colors.grey,
              indicatorPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: "Favorilerim"),
                Tab(text: "Kaydettiğim Aramalar"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [FavoriteTabContentOne(), FavoriteTabContentTwo()],
            ),
          ),
        ],
      ),
    );
  }
}
