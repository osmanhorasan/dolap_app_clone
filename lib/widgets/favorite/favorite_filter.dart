import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:dolap_app_clone/widgets/favorite/favorite_filter_selecttable_elevated_button.dart';
import 'package:dolap_app_clone/widgets/favorite/favorite_filter_sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:dolap_app_clone/widgets/favorite/favorite_filter_drawer.dart';

class FavoriteFilter extends StatefulWidget {
  const FavoriteFilter({super.key});

  @override
  State<FavoriteFilter> createState() => _FavoriteFilterState();
}

class _FavoriteFilterState extends State<FavoriteFilter> {
  int selectedIndex = 0;
  int selectedSortIndex = 0;

  void _showSortBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<int>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return FavoriteFilterSortBottomSheet(
          selectedIndex: selectedSortIndex,
          onSelected: (val) => Navigator.pop(context, val),
        );
      },
    );
    if (result != null) {
      setState(() {
        selectedSortIndex = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            TextButton.icon(
              onPressed: () {
                _showSortBottomSheet(context);
              },
              icon: Icon(Icons.swap_vert, color: Colors.teal),
              label: Text('Sırala', style: TextStyle(color: Colors.teal)),
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: 'Filtre',
                  transitionDuration: Duration(milliseconds: 350),
                  pageBuilder: (context, anim1, anim2) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: FavoriteFilterDrawer(),
                      ),
                    );
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    final offset =
                        Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: anim1,
                            curve: Curves.easeOutCubic,
                          ),
                        );
                    return SlideTransition(position: offset, child: child);
                  },
                );
              },
              icon: Icon(Icons.filter_alt_outlined, color: Colors.teal),
              label: Text('Filtrele', style: TextStyle(color: Colors.teal)),
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            FavoriteFilterSelectableElevatedButton(
              icon: Icons.circle,
              label: 'Fiyatı Düşenler',
              selected: selectedIndex == 0,
              selectedColor: StaticConstants.mainColor.withAlpha(25),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            SizedBox(width: 10),
            FavoriteFilterSelectableElevatedButton(
              icon: Icons.remove_red_eye_outlined,
              label: 'Satılanlar',
              selected: selectedIndex == 1,
              selectedColor: StaticConstants.mainColor.withAlpha(25),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            SizedBox(width: 10),
            FavoriteFilterSelectableElevatedButton(
              icon: Icons.fire_truck,
              label: 'Kargo Bedava',
              selected: selectedIndex == 2,
              selectedColor: StaticConstants.mainColor.withAlpha(25),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
            SizedBox(width: 10),
            FavoriteFilterSelectableElevatedButton(
              icon: Icons.stars,
              label: 'Süper Satıcı',
              selected: selectedIndex == 3,
              selectedColor: StaticConstants.mainColor.withAlpha(25),
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
