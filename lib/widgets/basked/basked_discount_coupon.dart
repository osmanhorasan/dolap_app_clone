import 'package:flutter/material.dart';

class BaskedDiscountCoupon extends StatefulWidget {
  const BaskedDiscountCoupon({super.key});

  @override
  State<BaskedDiscountCoupon> createState() => _BaskedDiscountCouponState();
}

class _BaskedDiscountCouponState extends State<BaskedDiscountCoupon> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: EdgeInsets.all(10),
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "İndirim Kuponları",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 75,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade300, width: 0.5),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.pinkAccent.shade100.withAlpha(51),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "%80'e varan İNDİRİM",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          size: 14,
                          color: Colors.pink.shade300,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "Son 1 gün",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 75,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade300, width: 0.5),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.pinkAccent.shade100.withAlpha(51),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "%80",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: isApplied
                              ? Colors.white
                              : Colors.pink.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(50),
                            side: BorderSide(
                              color: isApplied
                                  ? Colors.pink.shade300
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        onPressed: isApplied
                            ? () {}
                            : () {
                                setState(() {
                                  isApplied = true;
                                });
                              },
                        child: Text(
                          isApplied ? "Uygulandı" : "Uygula",
                          style: TextStyle(
                            fontSize: 12,
                            color: isApplied
                                ? Colors.pink.shade300
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 75,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.pink.shade300,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.pinkAccent.shade100.withAlpha(51),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink.shade300,
                          ),
                          child: Icon(Icons.add, size: 20, color: Colors.white),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Kupon Kodu\nEkle",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
