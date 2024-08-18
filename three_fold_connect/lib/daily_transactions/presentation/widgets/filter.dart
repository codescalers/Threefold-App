import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final ValueChanged<String?> onCurrencyChanged;

  const FilterWidget({
    super.key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filter by Currency',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    style: const TextStyle(color: Colors.white),
                    value: selectedCurrency,
                    onChanged: onCurrencyChanged,
                    items: currencies
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
