import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';
import '../../data/dummy_data.dart';

class VoteDialog extends StatefulWidget {
  const VoteDialog({super.key});

  @override
  State<VoteDialog> createState() => _VoteDialogState();
}

class _VoteDialogState extends State<VoteDialog> {
  String selectedFarm = "";
  List<String> farms = [];

  @override
  void initState() {
    // TODO: Fetch Farms List and remove this dummy data
    farms = farmList;
    super.initState();
  }

  List<DropdownMenuEntry<String>> _buildDropdownMenuEntries(
      List<String> farms) {
    return farms.map((farm) {
      return DropdownMenuEntry<String>(
        value: farm,
        label: farm,
        labelWidget: Text(
          farm,
          style: TextStyle(color: Colors.white, fontFamily: interBold),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), 
      ),
      backgroundColor: backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: DropdownMenu(
                menuHeight: MediaQuery.sizeOf(context).width * 0.5,
                enableFilter: true,
                width: MediaQuery.sizeOf(context).width * 0.6,
                textStyle: TextStyle(color: white, fontFamily: interBold),
                inputDecorationTheme: const InputDecorationTheme(
                  filled: true,
                  fillColor: secondryColor,
                ),
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                ),
                label: Text(
                  'Select Farm',
                  style: TextStyle(color: white, fontFamily: interBold),
                ),
                dropdownMenuEntries: _buildDropdownMenuEntries(farms),
                onSelected: (String? value) {
                  if (value != null) {
                    selectedFarm = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    //TODO: Call api to vote Yes
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: white,
                      fontFamily: interBold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //TODO: Call api to vote No
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: white,
                      fontFamily: interBold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
