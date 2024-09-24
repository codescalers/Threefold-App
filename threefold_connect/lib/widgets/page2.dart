import 'package:flutter/material.dart';
import 'package:threefold_connect/widgets/common_page.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonPage(
      title: 'MAXIMUM',
      subtitle: 'SECURITY',
      imagePath: 'assets/images/fingerprint.svg',
      description:
          'The app provides a secure authentication mechanism that provides your identity on the Threefold Grid.',
      imageHeight: 250,
    );
  }
}
