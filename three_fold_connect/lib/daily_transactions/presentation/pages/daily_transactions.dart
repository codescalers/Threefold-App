import 'package:flutter/material.dart';

import '../widgets/filter.dart';
import '../widgets/transaction.dart';
import '/widgets/app_bar.dart';

import '../widgets/header.dart';

class DailyTransactionsPage extends StatefulWidget {
  const DailyTransactionsPage({super.key});

  @override
  _DailyTransactionsPageState createState() => _DailyTransactionsPageState();
}

class _DailyTransactionsPageState extends State<DailyTransactionsPage> {
  String selectedCurrency = 'TFT';
  final List<String> currencies = ['TFT', 'All'];

  void _onCurrencyChanged(String? newCurrency) {
    if (newCurrency != null) {
      setState(() {
        selectedCurrency = newCurrency;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(title: 'Wallet'),
        body: Column(
          children: [
            const WalletInfoHeader(email: 'Daily@username'),
            const SizedBox(height: 16),
            FilterWidget(
              currencies: currencies,
              selectedCurrency: selectedCurrency,
              onCurrencyChanged: _onCurrencyChanged,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TransactionWidget(
                    isIncoming: index % 2 == 0,
                    status: "Completed",
                    transactionId:
                        'VerlyLongTransacationIDkfuiuaiuagigiuagiuwaghwag $index',
                    tftAmount: 100.0 + index,
                    date: '2022-01-0${index + 1}',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
