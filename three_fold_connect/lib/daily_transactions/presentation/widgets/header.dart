import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WalletInfoHeader extends StatelessWidget {
  final String email;

  const WalletInfoHeader({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
            child: Row(
          children: [
            Icon(Icons.wallet),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daily Transactions'),
                  Text(email),
                ],
              ),
            )
          ],
        ))
      ],
    ));
  }
}
