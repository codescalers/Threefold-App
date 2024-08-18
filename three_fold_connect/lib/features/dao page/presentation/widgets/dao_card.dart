import 'package:flutter/material.dart';
import 'package:three_fold_connect/features/dao%20page/presentation/widgets/show_result_dialog.dart';
import 'package:three_fold_connect/features/dao%20page/presentation/widgets/vote_dialog.dart';
import 'package:three_fold_connect/theme/theme.dart';

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
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.text,
              style: TextStyle(
                color: white,
                fontFamily: inter,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Divider(
            thickness: 2,
            color: white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
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
            padding: EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
              onPressed: () {},
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
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                side: BorderSide(
                  color: teritaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
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
            padding: EdgeInsets.symmetric(vertical: 8),
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
                      context: context, builder: (_) => new ShowResultDialog());
                },
                child: Text(
                  'Show result',
                  style: TextStyle(
                    color: white,
                    fontFamily: interBold,
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: backgroundColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (_) => new VoteDialog());
                },
                child: Text(
                  'Vote',
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
            ],
          ),
        ],
      ),
    );
  }
}
