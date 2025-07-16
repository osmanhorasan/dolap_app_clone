import 'package:flutter/material.dart';

class MoreListTile extends StatelessWidget {
  final String title;
  final String route;
  const MoreListTile({required this.title, this.route = '/home', super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16)),
            Icon(Icons.arrow_forward_ios, color: Color(0xFF1ED7B5), size: 20),
          ],
        ),
      ),
    );
  }
}
