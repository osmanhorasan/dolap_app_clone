import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:flutter/material.dart';

class AccountMain extends StatefulWidget {
  const AccountMain({super.key});

  @override
  State<AccountMain> createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildProfileHeader(),
            TabBar(
              controller: _tabController,
              labelColor: StaticConstants.mainColor,
              unselectedLabelColor: Colors.black54,
              indicatorColor: StaticConstants.mainColor,
              tabs: [
                Tab(text: 'Mağazam'),
                Tab(text: 'Ürünlerim'),
                Tab(text: 'Öne Çıkar'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMyStoreTab(),
                  Center(child: Text('Ürünlerim')),
                  Center(child: Text('Öne Çıkar')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 24, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.purple[200],
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: StaticConstants.mainColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(Icons.add, size: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@osmanhorasan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _ProfileStat(title: 'Satış', value: '0'),
              SizedBox(width: 16),
              _ProfileStat(title: 'Takipçi', value: '0'),
              SizedBox(width: 16),
              _ProfileStat(title: 'Takip', value: '0'),
              SizedBox(width: 16),
              _ProfileStat(title: 'Favori', value: '6'),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildMyStoreTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: StaticConstants.mainColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildStepItem(1, 'Ürün Yükle, Doğru Fiyatla'),
                  _buildStepItem(2, 'Gelen Soruları Hemen Yanıtla'),
                  _buildStepItem(3, 'Ürün Satılınca Kargola'),
                  _buildStepItem(4, 'Onaylanınca Paran Hesabında'),
                ],
              ),
            ),
            SizedBox(height: 24),
            _buildQuickSaleTools(),
            SizedBox(height: 24),
            _buildQuickSaleTips(),
            SizedBox(height: 24),
            _WeeklyGoalBanner(),
            SizedBox(height: 18),
            _OrderProcessSection(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSaleTools() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            'Hızlı Satış Araçları',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 24),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _QuickTool(icon: Icons.rocket_launch, label: 'Öne Çıkar'),
                  _QuickTool(icon: Icons.campaign, label: 'Kampanyaya Katıl'),
                  _QuickTool(icon: Icons.bar_chart, label: 'Performansım'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _QuickTool(icon: Icons.shopping_bag, label: 'Satışlarım'),
                  _QuickTool(icon: Icons.stacked_bar_chart, label: 'Gelişimim'),
                  _QuickTool(
                    icon: Icons.account_balance_wallet,
                    label: 'Dolap Bakiyem',
                  ),
                ],
              ),
              SizedBox(height: 32), // Butonun taşması için boşluk
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickSaleTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            'Hızlı Satış İpuçları',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFEFFFFE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fotoğraf Yükle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Ürün fotoğraflarını bol ışıklı, aydınlık alanlarda çek.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEEEE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Video Yükle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Ürünün tüm detaylarını ve varsa defolarını göstermek için ürün videosu ekle.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStepItem(int step, String text) {
    return ListTile(
      leading: CircleAvatar(
        radius: 12,
        backgroundColor: StaticConstants.mainColor,
        child: Text(
          '$step',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String title;
  final String value;
  const _ProfileStat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(title, style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}

class _QuickTool extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickTool({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade100,
          child: Icon(icon, color: StaticConstants.mainColor, size: 28),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: 70,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// --- EKLENEN WIDGET ---
class _OrderProcessVideoCard extends StatelessWidget {
  final String image;
  final String username;
  const _OrderProcessVideoCard({required this.image, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.play_arrow, color: Colors.white, size: 36),
              ),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                username,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeeklyGoalBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: PageView(
        children: [
          _ImagePage(
            imagePath:
                'https://cdn.dsmcdn.com/ty1712/tr-regular-banner/12b74da3-81f3-4fba-8efa-4fb3ff110e57tr_3242050.jpeg',
          ),
          _ImagePage(
            imagePath:
                'https://cdn.dsmcdn.com/ty1711/tr-regular-banner/b08cf323-a838-452a-8db7-932e5326f90etr_3238361.jpeg',
          ),
          _ImagePage(
            imagePath:
                'https://cdn.dsmcdn.com/ty1710/tr-regular-banner/1e5630b9-005c-4de9-8494-ff3a0b4324ddtr_3242270.jpeg',
          ),
        ],
      ),
    );
  }

  _ImagePage({required String imagePath}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

class _OrderProcessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dolap’ta Sipariş Süreci Nasıl Çalışır?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _OrderProcessVideoCard(
                image:
                    'https://cdn.dsmcdn.com/marketing/datascience/automation/2022/12/27/Tshirt_202212271855.jpg',
                username: '@dolap',
              ),
              SizedBox(width: 12),
              _OrderProcessVideoCard(
                image:
                    'https://cdn.dsmcdn.com/marketing/datascience/automation/2022/12/30/Pantolon_202212302146.jpg',
                username: '@dolap',
              ),
              SizedBox(width: 12),
              _OrderProcessVideoCard(
                image:
                    'https://cdn.dsmcdn.com/marketing/datascience/automation/2022/12/27/Tesettur_Giyim_202212271854.jpg',
                username: '@dolap',
              ),
              SizedBox(width: 12),
              _OrderProcessVideoCard(
                image:
                    'https://cdn.dsmcdn.com/marketing/datascience/automation/2022/12/27/Tshirt_202212271855.jpg',
                username: '@dolap',
              ),
              SizedBox(width: 12),
              _OrderProcessVideoCard(
                image:
                    'https://cdn.dsmcdn.com/marketing/datascience/automation/2022/12/30/Pantolon_202212302146.jpg',
                username: '@dolap',
              ),
              SizedBox(width: 12),
              _OrderProcessVideoCard(
                image:
                    'https://cdn.dsmcdn.com/marketing/datascience/automation/2022/12/27/Tesettur_Giyim_202212271854.jpg',
                username: '@dolap',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
