import 'package:flutter/material.dart';
import 'package:threefold_connect/widgets/common_page.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonPage(
      title: 'Welcome to',
      subtitle: '',
      imagePath: 'images/threefold_connect_logo.png',
      description:
          'Threefold Connect is your main access point to the Threefold Grid and more. Please allow us to quickly show you around!',
    );
  }
}
