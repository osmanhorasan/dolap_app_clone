import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;

  const BottomBarItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 2),
            child: Icon(
              icon,
              color: selected ? selectedColor : Colors.grey,
              size: 28,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? selectedColor : Colors.grey,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
