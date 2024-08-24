import 'package:flutter/material.dart';
import 'package:threefold_connect/theme/theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildFooterButton(Icons.money, () {
            // Handle button press
          }),
          _buildFooterButton(Icons.compare_arrows_sharp, () {
            // Handle button press
          }),
          _buildFooterButton(Icons.info_outline, () {
            // Handle button press
          }),
        ],
      ),
    );
  }

  Widget _buildFooterButton(IconData icon, VoidCallback onPressed) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkgrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: onPressed,
          child: Icon(icon),
        ),
      ),
    );
  }
}
