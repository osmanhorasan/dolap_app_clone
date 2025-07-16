import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/basked/basket_item_bottom_bar.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  APIService apiService = APIService();

  bool _isCheck3D = false;
  int _isCheckSelect = 1;
  bool _isShop = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final id = args?['id'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Güvenli Ödeme'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(Icons.lock_outline, color: Colors.green),
                SizedBox(width: 4),
                Text(
                  'SSL',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' secured',
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: apiService.getProductById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            final product = snapshot.data!;
            final double urunFiyati = product.price ?? 0;
            final double indirim =
                product.discountPercentage != null && product.price != null
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

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teslimat Adresi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Adress Ekle',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Adres boş olamaz';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Kart Bilgileri',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _cardNumberController,
                        decoration: InputDecoration(
                          labelText: 'Banka veya Kredi Kartı No',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kart numarası boş olamaz';
                          }
                          if (value.replaceAll(' ', '').length != 16) {
                            return 'Kart numarası 16 haneli olmalı';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _expiryController,
                              decoration: InputDecoration(
                                labelText: 'Ay / Yıl',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.datetime,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ay/Yıl boş olamaz';
                                }
                                final regExp = RegExp(
                                  r'^(0[1-9]|1[0-2])\/(\d{2})$',
                                );
                                if (!regExp.hasMatch(value)) {
                                  return 'MM/YY formatında giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _cvvController,
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.info_outline, size: 20),
                              ),
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              maxLength: 3,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'CVV boş olamaz';
                                }
                                if (value.length != 3) {
                                  return 'CVV 3 haneli olmalı';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: StaticConstants.mainColor,
                            value: _isCheck3D,
                            onChanged: (v) {
                              setState(() {
                                _isCheck3D = v ?? false;
                              });
                            },
                          ),
                          const Text('3D ile ödemek istiyorum'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Taksit Seçenekleri',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Kredi kartlarına 9 taksit imkanı!',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: RadioListTile<int>(
                          activeColor: StaticConstants.mainColor,
                          value: _isCheckSelect,
                          groupValue: 1,
                          onChanged: (v) {
                            setState(() {
                              _isCheckSelect = v ?? 1;
                            });
                          },
                          title: Text(
                            'Tek Çekim ${toplam.toStringAsFixed(2)} TL',
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: StaticConstants.mainColor,
                            value: _isShop,
                            onChanged: (v) {
                              setState(() {
                                _isShop = v ?? false;
                              });
                            },
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Satış Sözleşmesi’ni ',
                                  style: TextStyle(
                                    color: StaticConstants.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'onaylıyorum.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text('Ürün bulunamadı.'));
          }
        },
      ),
      bottomNavigationBar: FutureBuilder(
        future: apiService.getProductById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 80,
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return SizedBox(
              height: 80,
              child: Center(child: Text('Hata: ${snapshot.error}')),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            final product = snapshot.data!;
            final double urunFiyati = product.price ?? 0;
            final double indirim =
                product.discountPercentage != null && product.price != null
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

            return BasketItemBottomBar(
              ustBilgi: '250 TL ve üzeri siparişlerde Kargo Bedava',
              urunFiyati: urunFiyati,
              aliciKorumaHizmeti: aliciKorumaHizmeti,
              kargoUcreti: kargoUcreti,
              kargoBedava: kargoBedava,
              indirim: indirim,
              toplam: toplam,
              onOdemeGec: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // Ödeme işlemi başlat
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ödeme işlemi başlatıldı!')),
                  );
                  Navigator.pushNamed(context, "/account");
                }
              },
            );
          } else {
            return SizedBox(
              height: 80,
              child: Center(child: Text('Ürün bulunamadı.')),
            );
          }
        },
      ),
    );
  }
}
