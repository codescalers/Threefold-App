import 'package:flutter/material.dart';
import 'package:threefold_connect/daily_transacations/presentation/widgets/footer.dart';
import 'package:threefold_connect/daily_transacations/presentation/widgets/header.dart';
import 'package:threefold_connect/daily_transacations/presentation/widgets/transaction_details.dart';
import 'package:threefold_connect/main.dart';
import 'package:threefold_connect/widgets/app_bar.dart';

class TransactionDetailsPage extends StatelessWidget {
  final String transactionId;
  final String status;
  final String asset;
  final String sender;
  final String receiver;
  final String paymentType;
  final String transactionHash;
  final String? memo;
  final String amount;
  final String date;

  const TransactionDetailsPage({
    super.key,
    required this.transactionId,
    required this.status,
    required this.asset,
    required this.sender,
    required this.receiver,
    required this.paymentType,
    required this.transactionHash,
    required this.amount,
    required this.date,
    this.memo,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Wallet'),
      body: Column(
        children: [
          WalletInfoHeader(email: 'Daily@username'),
          Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: TransactionDetails(
                  transactionId: 'aufhiufa',
                  status: 'idk',
                  asset: 'TFT',
                  sender: 'akuakugagak',
                  receiver: 'wjbfafbafb',
                  paymentType: 'IDK',
                  transactionHash: 'iufwiufwiufwif',
                  amount: 'hmmmmm',
                  date: 'idk'),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
