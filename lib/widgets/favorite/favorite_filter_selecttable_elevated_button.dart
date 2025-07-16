import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:flutter/material.dart';

class FavoriteFilterSelectableElevatedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color? selectedColor;

  const FavoriteFilterSelectableElevatedButton({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: selected
            ? (selectedColor ??
                  StaticConstants.mainColor.withValues(alpha: 0.1))
            : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 1,
            color: selected
                ? (selectedColor ?? StaticConstants.mainColor)
                : Colors.grey.shade300,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      ),
    );
  }
}
