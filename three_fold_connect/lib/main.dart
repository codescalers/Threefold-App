import 'package:flutter/material.dart';
import 'package:three_fold_connect/features/dao%20page/presentation/pages/dao_page.dart';
import 'package:three_fold_connect/theme/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThreeFold Connect',
      theme: threefoldTheme,
      home: DaoPage(),
    );
  }
}

