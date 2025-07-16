import 'package:flutter/material.dart';

class FavoriteFilterSortBottomSheet extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const FavoriteFilterSortBottomSheet({
    Key? key,
    required this.selectedIndex,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sırala',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 16),
          RadioListTile<int>(
            value: 0,
            groupValue: selectedIndex,
            onChanged: (val) {
              if (val != null) onSelected(val);
            },
            title: Text('Önerilen'),
          ),
          RadioListTile<int>(
            value: 1,
            groupValue: selectedIndex,
            onChanged: (val) {
              if (val != null) onSelected(val);
            },
            title: Text('En Düşük Fiyat'),
          ),
          RadioListTile<int>(
            value: 2,
            groupValue: selectedIndex,
            onChanged: (val) {
              if (val != null) onSelected(val);
            },
            title: Text('En Yüksek Fiyat'),
          ),
        ],
      ),
    );
  }
}
