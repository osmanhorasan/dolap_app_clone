import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:dolap_app_clone/utils/models/search_actions_model.dart';
import 'package:dolap_app_clone/widgets/bottom_bar_main.dart';
import 'package:dolap_app_clone/widgets/search/search_actions.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '@osmanhorasan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          SearchActions(
            actions: SearchActionsModel(isSearch: false, isSetting: true),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _QuickAccessButton(
                    icon:
                        'https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/shopping_basket.png',
                    label: 'Aldıklarım',
                  ),
                  _QuickAccessButton(
                    icon:
                        'https://img.freepik.com/premium-vector/sack-money-big-pile-cash-money-icon-illustration-money-bag-flat-icon_385450-362.jpg',
                    label: 'Dolap Bakiyem',
                  ),
                  _QuickAccessButton(
                    icon:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIOB-C049ZFe5pY7r_Iyn3fS1q1agt8w8OXQ&s',
                    label: 'Sattıklarım',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent.shade100,
                    Colors.lightBlue.shade100,
                    Colors.blue.shade700,
                  ],
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    "https://pbs.twimg.com/profile_images/1632671882078978048/57AuGXDL_400x400.jpg",
                    width: 50,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '%80 İndirimli Ürünler Burada!',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Bu inanılmaz fırsatı yakalamak için hemen tıkla!",
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
            SizedBox(height: 8),

            Container(
              color: StaticConstants.mainColor.withValues(alpha: 0.1),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Seninle iletişimde kalabilmemiz için e-posta adresini doğrulaman gerekiyor.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StaticConstants.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Doğrula',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            _AccountMenuList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarMain(selectedIndex: 4),
    );
  }
}

class _QuickAccessButton extends StatelessWidget {
  final String icon;
  final String label;
  const _QuickAccessButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          backgroundImage: NetworkImage(icon),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

class _AccountMenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AccountMenuItem(icon: Icons.person_outline, label: 'Dolabım'),
        _AccountMenuItem(
          icon: Icons.rocket_launch_outlined,
          label: 'Öne Çıkar',
        ),
        _AccountMenuItem(
          icon: Icons.local_offer_outlined,
          label: 'Kampanya Merkezi',
        ),
        _AccountMenuItem(
          icon: Icons.verified_user_outlined,
          label: 'Satıcı Doğrulama',
          trailing: Text(
            'Doğrulanmadı',
            style: TextStyle(color: Colors.pink, fontSize: 14),
          ),
        ),
        SizedBox(height: 10),
        _AccountMenuItem(
          icon: Icons.favorite_border,
          label: 'Favorilerim',
          href: "/favorite",
        ),
        _AccountMenuItem(icon: Icons.percent, label: 'Kuponlarım'),
        _AccountMenuItem(icon: Icons.tag_faces, label: 'Markam ve Bedenim'),
        _AccountMenuItem(
          icon: Icons.pin_end,
          label: 'Kaydettigim Aramalar',
          href: "/favorite",
        ),
        SizedBox(height: 10),
        _AccountMenuItem(icon: Icons.percent, label: 'Tekliflerim'),
        _AccountMenuItem(icon: Icons.checkroom, label: 'Dolap Topluluğum'),
        SizedBox(height: 10),
        _AccountMenuItem(icon: Icons.call, label: 'Dolap Müşteri Hizmetleri'),
        _AccountMenuItem(
          icon: Icons.phone_callback,
          label: 'Geri Bildirim Ver',
        ),
        SizedBox(height: 10),
        _AccountMenuItem(
          icon: Icons.logout,
          label: 'Çıkış Yap',
          href: "/auth/main",
        ),
      ],
    );
  }
}

class _AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final String? href;
  const _AccountMenuItem({
    required this.icon,
    required this.label,
    this.trailing,
    this.href,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: TextStyle(fontSize: 16)),
      trailing:
          trailing ??
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: StaticConstants.mainColor,
          ),
      onTap: () {
        Navigator.pushNamed(context, href ?? "");
      },
    );
  }
}
