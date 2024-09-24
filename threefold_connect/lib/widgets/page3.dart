import 'package:flutter/material.dart';
import 'package:threefold_connect/widgets/common_page.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonPage(
      title: 'THREEFOLD',
      subtitle: 'WALLET',
      imagePath: 'assets/images/TFT.svg',
      description:
          'Access your ThreeFold Wallet and your ThreeFold Tokens (TFT). More currencies are to be added in the future.',
      imageHeight: 100,
      imageWidth: 100,
    );
  }
}
