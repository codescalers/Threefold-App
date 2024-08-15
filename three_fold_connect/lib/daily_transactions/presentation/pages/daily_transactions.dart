import 'package:flutter/material.dart';
import 'package:three_fold_connect/daily_transactions/presentation/widgets/header.dart';
import 'package:three_fold_connect/widgets/app_bar.dart';

class DailyTransactionsPage extends StatelessWidget {
  const DailyTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: 'Wallet'),
        body: Column(
          children: [
            WalletInfoHeader(email: 'Daily@username'),
          ],
        ),
      ),
    );
  }
}
