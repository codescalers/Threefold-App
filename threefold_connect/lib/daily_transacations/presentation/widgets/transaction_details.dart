import 'package:flutter/material.dart';
import 'package:threefold_connect/theme/theme.dart';

class TransactionDetails extends StatelessWidget {
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

  const TransactionDetails({
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              const Text(
                'Transaction Details',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          _buildDetailRow('Sender', sender),
          const Divider(),
          _buildDetailRow('Receiver', receiver),
          const Divider(),
          _buildDetailRow('Payment Type', paymentType),
          const Divider(),
          _buildDetailRow('Amount', amount),
          const Divider(),
          _buildDetailRow('Asset', asset),
          const Divider(),
          _buildDetailRow('date', date),
          const Divider(),
          _buildDetailRow('Transaction Hash', transactionHash),
          const Divider(),
          _buildDetailRow('memo', memo ?? '...'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  value,
                  style: const TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
