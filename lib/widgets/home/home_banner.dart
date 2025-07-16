import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.dsmcdn.com/ty1707/tr-event-banner/e04f2809-ca4c-46ea-a12f-3efc82e5e3d4tr_3245602.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.dsmcdn.com/ty1707/tr-event-banner/fe70f343-6daa-4cfa-bc56-74601ff02075tr_3244836.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.dsmcdn.com/ty1707/tr-event-banner/b0b19d13-db2a-4fc3-8834-4d2be467ba81tr_3244839.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
