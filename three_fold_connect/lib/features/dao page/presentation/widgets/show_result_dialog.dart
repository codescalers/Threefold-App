import 'package:flutter/material.dart';
import 'package:three_fold_connect/theme/theme.dart';



/// TODO : Add animation ll loadings ---> research how to do this
class ShowResultDialog extends StatefulWidget {
  const ShowResultDialog({super.key});

  @override
  State<ShowResultDialog> createState() => _ShowResultDialogState();
}

class _ShowResultDialogState extends State<ShowResultDialog> {
  int got = 1;
  int total = 5;
  int yes = 60;
  int no = 40;

  @override
  void initState() {
    // TODO: Fetch api to get number of yes, no , got , total
    super.initState();
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
          Stack(
            alignment: Alignment.center,
            children: [
              LinearProgressIndicator(
                minHeight: 30,
                color: secondryColor,
                backgroundColor: primaryColor,
                value: (got / total),
              ),
              Center(
                child: Text(
                  'Threshold $got/$total',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: inter,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yes',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: interBold,
                ),
              ),
              Text(
                '${(yes / (yes + no)) * 100}%',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: inter,
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            color: secondryColor,
            backgroundColor: grey,
            value: (yes / (yes + no)),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: interBold,
                ),
              ),
              Text(
                '${(no / (yes + no)) * 100}%',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: inter,
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            color: darkred,
            backgroundColor: grey,
            value: (no / (yes + no)),
          ),
        ]),
      ),
    );
  }
}
