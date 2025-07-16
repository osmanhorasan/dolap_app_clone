import 'package:dolap_app_clone/widgets/bottom_bar_main_item.dart';
import 'package:flutter/material.dart';

class BottomBarMain extends StatefulWidget {
  int? selectedIndex;
  BottomBarMain({super.key, this.selectedIndex = 0});

  @override
  State<BottomBarMain> createState() => _BottomBarMainState();
}

class _BottomBarMainState extends State<BottomBarMain> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, "/home");
          break;
        case 1:
          Navigator.pushNamed(context, "/favorite");
          break;
        case 2:
          Navigator.pushNamed(context, "/account/main");
          break;

        case 3:
          Navigator.pushReplacementNamed(context, "/basket");
          break;
        case 4:
          Navigator.pushNamed(context, "/account");
          break;
        default:
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBarItem(
              icon: Icons.home,
              label: 'Ana Sayfa',
              selected: _selectedIndex == 0,
              selectedColor: Color(0xff08E1A1),
              onTap: () => _onItemTapped(0),
            ),
            Stack(
              children: [
                BottomBarItem(
                  icon: Icons.favorite_border,
                  label: 'Favorilerim',
                  selected: _selectedIndex == 1,
                  selectedColor: Color(0xff08E1A1),
                  onTap: () => _onItemTapped(1),
                ),
                if (true)
                  Positioned(
                    right: 12,
                    top: 8,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
            InkWell(
              onTap: () => _onItemTapped(2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 2, top: 0),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 2
                            ? Color(0xff08E1A1)
                            : Color(0xff08E1A1),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.checkroom,
                        color: _selectedIndex == 2
                            ? Colors.white
                            : Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  Text(
                    'Dolabım',
                    style: TextStyle(
                      fontSize: 12,
                      color: _selectedIndex == 2
                          ? Color(0xff08E1A1)
                          : Colors.grey,
                      fontWeight: _selectedIndex == 2
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            // Sepetim
            BottomBarItem(
              icon: Icons.shopping_cart_outlined,
              label: 'Sepetim',
              selected: _selectedIndex == 3,
              selectedColor: Color(0xff08E1A1),
              onTap: () => _onItemTapped(3),
            ),
            // Hesabım
            BottomBarItem(
              icon: Icons.person_outline,
              label: 'Hesabım',
              selected: _selectedIndex == 4,
              selectedColor: Color(0xff08E1A1),
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
