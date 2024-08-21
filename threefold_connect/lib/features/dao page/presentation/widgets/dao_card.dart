import 'package:flutter/material.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/show_result_dialog.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/vote_dialog.dart';
import 'package:threefold_connect/theme/theme.dart';


class DaoCard extends StatefulWidget {
  final String text;
  final String description;
  final String date;
  const DaoCard({
    required this.text,
    required this.description,
    required this.date,
    super.key,
  });

  @override
  State<DaoCard> createState() => _DaoCardState();
}

class _DaoCardState extends State<DaoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.text,
              style: TextStyle(
                color: white,
                fontFamily: inter,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const Divider(
            thickness: 2,
            color: grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.description,
              style: TextStyle(
                color: white,
                fontFamily: inter,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                side: const BorderSide(
                  color: teritaryColor,
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Go to proposal',
                  style: TextStyle(
                    color: teritaryColor,
                    fontFamily: interBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can vote until :',
                style: TextStyle(
                  color: white,
                  fontFamily: interBold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.date,
                style: TextStyle(
                  color: white,
                  fontFamily: inter,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (_) => const ShowResultDialog());
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: backgroundColor,
                ),
                child: Text(
                  'Show result',
                  style: TextStyle(
                    color: white,
                    fontFamily: interBold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (_) => const VoteDialog());
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: primaryColor,
                ),
                child: Text(
                  'Vote',
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
    );
  }
}
