import 'package:flutter/material.dart';
import 'package:tfchain_client/models/dao.dart';

import '../../../../theme/theme.dart';
import '../../data/vote.dart';

class VoteDialog extends StatefulWidget {
  final Proposal proposal;
  const VoteDialog({
    required this.proposal,
    super.key,
  });

  @override
  State<VoteDialog> createState() => _VoteDialogState();
}

class _VoteDialogState extends State<VoteDialog> {
  String selectedFarm = "";
  List<String> farms = [];

  @override
  void initState() {
    // TODO: Fetch Farms List and remove this dummy data
    //farms = farmList;
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
      backgroundColor: secondaryColor,
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
                  fillColor: backgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide.none,
                  ),
                ),
                menuStyle: MenuStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(backgroundColor),
                  surfaceTintColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>( 
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
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
                  onPressed: () async {
                    //vote(true, widget.proposal.hash, 4979); // Fix FarmID
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
                  onPressed: () async {
                    //vote(false, widget.proposal.hash, 0); // Fix FarmID
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: backgroundColor,
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
