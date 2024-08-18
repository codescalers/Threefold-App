import 'package:flutter/material.dart';
import 'package:three_fold_connect/theme/theme.dart';

class VoteDialog extends StatefulWidget {
  const VoteDialog({super.key});

  @override
  State<VoteDialog> createState() => _VoteDialogState();
}

//TODO : make el height bt3o change based on the menu open or closed
class _VoteDialogState extends State<VoteDialog> {
  String selectedFarm = "";
  final List<String> Farms = ['Option 1', 'Option 2', 'Option 3' , 'List']; //Dummy Data for now should be an empty list

  @override
  void initState() {
    // TODO: Get Farms Options
    super.initState();
  }


  List<DropdownMenuEntry<String>> _buildDropdownMenuEntries(List<String> farms) {
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
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownMenu(
              enableFilter: true,
              width: MediaQuery.sizeOf(context).width * 0.6,
              textStyle: TextStyle(color: white, fontFamily: interBold),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: primaryColor,
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
              ),
              label: Text(
                'Select Farm',
                style: TextStyle(color: white, fontFamily: interBold),
              ),
              dropdownMenuEntries: _buildDropdownMenuEntries(Farms),
              onSelected: (String? value) {
                if (value != null) {
                  print('Selected: $value');
                  selectedFarm = value;
                }
              },
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    //TODO: Call api to vote Yes
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: white,
                      fontFamily: interBold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: secondryColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //TODO: Call api to vote No
                  },
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: white,
                      fontFamily: interBold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: primaryColor,
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
