import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridproxy_client/models/farms.dart';
import 'package:tfchain_client/models/dao.dart';

import '../../../../theme/theme.dart';
import '../../data/get_farms_list.dart';
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
  int? farmId;
  List<Farm> farms = [];

  void setFarms() async {
    List<Farm> farmsList =
        await getMyFarms(0); //TODO: replace with actual twin id
    setState(() {
      farms = farmsList;
    });
  }

  @override
  void initState() {
    setFarms();
    super.initState();
  }

  List<DropdownMenuEntry<int>> _buildDropdownMenuEntries(List<Farm> farms) {
    return farms.map((farm) {
      return DropdownMenuEntry<int>(
        value: farm.farmID,
        label: farm.name,
        labelWidget: Text(
          farm.name,
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
            DropdownMenu(
              menuHeight: MediaQuery.sizeOf(context).height * 0.3,
              enableFilter: true,
              width: MediaQuery.sizeOf(context).width * 0.55,
              textStyle:
                  TextStyle(color: white, fontFamily: interBold, fontSize: 14),
              trailingIcon: const Icon(
                CupertinoIcons.chevron_down,
                color: white,
                size: 18,
              ),
              selectedTrailingIcon: const Icon(
                CupertinoIcons.chevron_up,
                color: white,
                size: 18,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: backgroundColor,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    color: secondaryColor,
                    width: 8.0,
                  ),
                ),
                contentPadding: EdgeInsets.only(right: 5, left: 15),
              ),
              menuStyle: MenuStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(backgroundColor),
                surfaceTintColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.only(right: 5, left: 15, bottom: 5)),
              ),
              label: Text(
                'Select Farm',
                style: TextStyle(
                    color: white, fontFamily: interBold, fontSize: 14),
              ),
              dropdownMenuEntries: _buildDropdownMenuEntries(farms),
              onSelected: (int? value) {
                if (value != null) {
                  farmId = value;
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    if (farmId != null) {
                      vote(true, widget.proposal.hash, farmId!);
                    }
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
                    if (farmId != null) {
                      vote(false, widget.proposal.hash, farmId!);
                    }
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
