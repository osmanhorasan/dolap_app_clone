import 'dart:math';
import 'package:dolap_app_clone/widgets/bottom_bar_main.dart';
import 'package:dolap_app_clone/widgets/home/home_tap_bar.dart';
import 'package:dolap_app_clone/widgets/search/search_input.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SearchInput(isReadOnly: true)),
            Expanded(flex: 10, child: HomeTapBar()),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarMain(selectedIndex: 0),
    );
  }
}
