import 'package:dolap_app_clone/utils/constants/static_constants.dart';
import 'package:flutter/material.dart';

class BasketItemBottomBar extends StatefulWidget {
  final String ustBilgi;
  final double urunFiyati;
  final double aliciKorumaHizmeti;
  final double kargoUcreti;
  final double kargoBedava;
  final double indirim;
  final double toplam;
  final VoidCallback onOdemeGec;

  const BasketItemBottomBar({
    super.key,
    required this.ustBilgi,
    required this.urunFiyati,
    required this.aliciKorumaHizmeti,
    required this.kargoUcreti,
    required this.kargoBedava,
    required this.indirim,
    required this.toplam,
    required this.onOdemeGec,
  });

  @override
  State<BasketItemBottomBar> createState() => _BasketItemBottomBarState();
}

class _BasketItemBottomBarState extends State<BasketItemBottomBar> {
  bool _detaylarAcik = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.local_shipping,
                color: Colors.deepPurple,
                size: 18,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  widget.ustBilgi,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_detaylarAcik) ...[
            _row('Ürün Fiyatı', widget.urunFiyati, color: Colors.grey.shade500),
            _row(
              'Alıcı Koruma Hizmeti (Sana Özel)',
              widget.aliciKorumaHizmeti,
              color: StaticConstants.mainColor,
            ),
            _row(
              'Kargo Ücreti',
              widget.kargoUcreti,
              color: Colors.grey.shade500,
            ),
            _row(
              'Kargo Bedava',
              widget.kargoBedava,
              color: StaticConstants.mainColor,
            ),
            _row(
              '%80 İndirim 🎉',
              widget.indirim,
              color: StaticConstants.mainColor,
            ),
          ],
          Divider(height: 24),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _detaylarAcik = !_detaylarAcik;
                      });
                    },
                    icon: Icon(
                      _detaylarAcik
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: StaticConstants.mainColor,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Toplam:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        '${widget.toplam.toStringAsFixed(0)} ₺',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: widget.onOdemeGec,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StaticConstants.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Ödemeye Geç',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _row(String label, double value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: color ?? Colors.black87, fontSize: 15),
          ),
          Text(
            (value >= 0 ? '' : '-') + value.abs().toStringAsFixed(2) + ' TL',
            style: TextStyle(
              color: color ?? Colors.black,
              fontWeight: value < 0 ? FontWeight.w600 : FontWeight.normal,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
