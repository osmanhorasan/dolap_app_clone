import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:flutter/material.dart';

class FavoriteFilterDrawer extends StatefulWidget {
  const FavoriteFilterDrawer({Key? key}) : super(key: key);

  @override
  State<FavoriteFilterDrawer> createState() => _FavoriteFilterDrawerState();
}

class _FavoriteFilterDrawerState extends State<FavoriteFilterDrawer> {
  // Switchler için state
  bool fiyatDus = false;
  bool satilanGizle = false;
  bool superSatici = false;
  bool ucretsizKargo = false;
  bool kampanya = false;
  bool kuponlu = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.95,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Filtre',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: [
                    _buildArrowTile('Kategori'),
                    _buildArrowTile('Marka'),
                    _buildArrowTile('Renk'),
                    _buildArrowTile('Kullanım Durumu'),
                    _buildArrowTile('Fiyat'),
                    SizedBox(height: 8),
                    _buildSwitchTile(
                      'Fiyatı Düşenler',
                      fiyatDus,
                      (v) => setState(() => fiyatDus = v),
                    ),
                    _buildSwitchTile(
                      'Satılanları Gizle',
                      satilanGizle,
                      (v) => setState(() => satilanGizle = v),
                    ),
                    _buildSuperSaticiTile(),
                    _buildSwitchTile(
                      'Ücretsiz Kargo',
                      ucretsizKargo,
                      (v) => setState(() => ucretsizKargo = v),
                    ),
                    _buildSwitchTile(
                      'Kampanyalı Ürünler',
                      kampanya,
                      (v) => setState(() => kampanya = v),
                    ),
                    _buildSwitchTile(
                      'Kuponlu Ürünler',
                      kuponlu,
                      (v) => setState(() => kuponlu = v),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 8,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StaticConstants.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      // Filtre uygula
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Ürünleri Gör',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArrowTile(String title) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Icon(Icons.chevron_right, color: Color(0xFF1CC6AE)),
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        Divider(height: 1, thickness: 1),
      ],
    );
  }

  Widget _buildSwitchTile(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Switch(
            activeColor: StaticConstants.mainColor,
            value: value,
            onChanged: onChanged,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        Divider(height: 1, thickness: 1),
      ],
    );
  }

  Widget _buildSuperSaticiTile() {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text('Süper Satıcılar'),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Yeni',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          trailing: Switch(
            activeColor: StaticConstants.mainColor,
            value: superSatici,
            onChanged: (v) => setState(() => superSatici = v),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        Divider(height: 1, thickness: 1),
      ],
    );
  }
}
