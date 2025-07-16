import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/basked/basked_discount_coupon.dart';
import 'package:dolap_app_clone/widgets/basked/basket_empty.dart';
import 'package:dolap_app_clone/widgets/basked/basket_item.dart';
import 'package:dolap_app_clone/widgets/basked/basket_item_bottom_bar.dart';
import 'package:dolap_app_clone/widgets/bottom_bar_main.dart';
import 'package:dolap_app_clone/widgets/detail/detail-bottom-bar.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final id = args?['id'];
    APIService apiService = APIService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Sepetim (${id == null ? '0 Ürün' : '1 Ürün'})',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: StaticConstants.mainColor),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: id == null
          ? Center(child: BasketEmpty())
          : FutureBuilder(
              future: apiService.getProductById(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Bir hata oluştu: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final product = snapshot.data!;
                  final double urunFiyati = product.price ?? 0;
                  final double indirim =
                      product.discountPercentage != null &&
                          product.price != null
                      ? -((product.price! * product.discountPercentage!) / 100)
                      : 0;
                  final double aliciKorumaHizmeti = 0;
                  final double kargoUcreti = 44.99;
                  final double kargoBedava = -44.99;
                  final double toplam =
                      urunFiyati +
                      aliciKorumaHizmeti +
                      kargoUcreti +
                      kargoBedava +
                      indirim;

                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF7E6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF4CAF50),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Bu ürünü alırsan hizmet bedeli ödemeyeceksin. 1 Ağustos\'a kadar fırsatı kaçırma!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isSelected ? BaskedDiscountCoupon() : SizedBox(),
                          Column(
                            children: [
                              BasketItem(
                                isSelected: isSelected,
                                product: product,
                                onSelected: (selected) {
                                  setState(() {
                                    isSelected = selected;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: BasketItemBottomBar(
                      ustBilgi: "250 TL ve üzeri siparişlerde Kargo Bedava",
                      urunFiyati: urunFiyati,
                      aliciKorumaHizmeti: aliciKorumaHizmeti,
                      kargoUcreti: kargoUcreti,
                      kargoBedava: kargoBedava,
                      indirim: indirim,
                      toplam: toplam,
                      onOdemeGec: () {
                        Navigator.pushNamed(
                          context,
                          "/checkout",
                          arguments: {'id': product.id},
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: Text("Ürün bulunamadı."));
                }
              },
            ),
      bottomNavigationBar: BottomBarMain(selectedIndex: 3),
    );
  }
}
