import 'package:flutter/material.dart';
import 'package:threefold_connect/theme/theme.dart';

class ShowResultDialog extends StatefulWidget {
  const ShowResultDialog({super.key});

  @override
  State<ShowResultDialog> createState() => _ShowResultDialogState();
}

class _ShowResultDialogState extends State<ShowResultDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _noAnimation;
  late Animation<double> _yesAnimation;
  late Animation<double> _thresholdAnimation;
  int got = 0;
  int total = 0;
  int yes = 0;
  int no = 0;

  @override
  void initState() {
    //TODO: Fetch api to get number of yes, no , got , total  and remove dummy data below
    got = 1;
    total = 5;
    yes = 60;
    no = 40;

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _noAnimation = Tween<double>(
      begin: 0.0,
      end: (no / (yes + no)),
    ).animate(_animationController);

    _yesAnimation = Tween<double>(
      begin: 0.0,
      end: (yes / (yes + no)),
    ).animate(_animationController);

    _thresholdAnimation = Tween<double>(
      begin: 0.0,
      end: (got / total),
    ).animate(_animationController);

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    minHeight: 40,
                    value: _thresholdAnimation.value,
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: backgroundColor,
                  );
                },
              ),
              Center(
                child: Text(
                  'Threshold $got/$total',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: inter,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yes',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: interBold,
                  fontSize: 16,
                ),
              ),
              Text(
                '${(yes / (yes + no)) * 100}%',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: inter,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _yesAnimation.value,
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: grey,
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: interBold,
                  fontSize: 16,
                ),
              ),
              Text(
                '${(no / (yes + no)) * 100}%',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: inter,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _noAnimation.value,
                color: darkred,
                backgroundColor: grey,
              );
            },
          ),
        ]),
      ),
    );
  }
}
