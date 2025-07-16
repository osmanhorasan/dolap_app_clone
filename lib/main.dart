import 'package:dolap_app_clone/screens/account_main.dart';
import 'package:dolap_app_clone/screens/account_page.dart';
import 'package:dolap_app_clone/screens/auth/auth_login.dart';
import 'package:dolap_app_clone/screens/auth/auth_main.dart';
import 'package:dolap_app_clone/screens/auth/auth_register.dart';
import 'package:dolap_app_clone/screens/basket_page.dart';
import 'package:dolap_app_clone/screens/checkout_page.dart';
import 'package:dolap_app_clone/screens/detail_page.dart';
import 'package:dolap_app_clone/screens/favorite/favorite_page.dart';
import 'package:dolap_app_clone/screens/home_page.dart';
import 'package:dolap_app_clone/screens/search/search.dart';
import 'package:dolap_app_clone/screens/search/search_categories.dart';
import 'package:dolap_app_clone/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/auth/main': (context) => const AuthMain(),
        '/auth/login': (context) => const AuthLogin(),
        '/auth/register': (context) => const AuthRegister(),
        '/home': (context) => const HomePage(),
        '/search/search': (context) => const SearchPage(),
        '/search/search-categories': (context) => const SearchCategoriesPage(),
        '/detail': (context) => DetailPage(),
        '/favorite': (context) => FavoritePage(),
        '/basket': (context) => BasketPage(),
        '/checkout': (context) => CheckoutPage(),
        '/account': (context) => AccountPage(),
        '/account/main': (context) => AccountMain(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen.shade600,
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade200,
          thickness: 1,
          space: 0,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xffFAFAFA),
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          labelStyle: TextStyle(color: Colors.grey.shade600),
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
