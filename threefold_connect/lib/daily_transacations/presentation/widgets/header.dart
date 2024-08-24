import 'package:flutter/material.dart';

class WalletInfoHeader extends StatelessWidget {
  final String email;

  const WalletInfoHeader({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.wallet),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    'Daily',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
