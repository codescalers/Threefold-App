import 'package:flutter/material.dart';
import 'package:threefold_connect/daily_transacations/presentation/widgets/arrow_inward.dart';
import 'package:threefold_connect/theme/theme.dart';

class TransactionWidget extends StatelessWidget {
  final bool isIncoming;
  final String transactionId;
  final double tftAmount;
  final String date;
  final String status;

  const TransactionWidget({
    super.key,
    required this.isIncoming,
    required this.transactionId,
    required this.tftAmount,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                isIncoming ? Theme.of(context).primaryColor : brightRed,
            child: isIncoming
                ? const ArrowInward()
                : const Icon(
                    Icons.arrow_outward,
                    color: Colors.white,
                  ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionId,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TFT $tftAmount',
                      style: TextStyle(
                        fontSize: 14,
                        color: isIncoming ? Colors.green : Colors.red,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: status == 'Completed'
                  ? Theme.of(context).primaryColor
                  : Colors.red,
              border: Border.all(
                color: status == 'Completed' ? Colors.green : Colors.red,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: status == 'Completed' ? Colors.white : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
