import 'package:flutter/material.dart';
import 'package:threefold_connect/widgets/common_page.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonPage(
      title: 'THREEFOLD',
      subtitle: 'NEWS',
      imagePath: 'assets/images/news.svg',
      description:
          "Stay updated with ThreeFold's latest updates via the News section within the app.",
      imageHeight: 350,
      imageWidth: 250,
    );
  }
}
