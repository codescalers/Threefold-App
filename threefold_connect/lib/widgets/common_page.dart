import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String description;
  final double imageHeight;
  final double imageWidth;

  const CommonPage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.description,
    this.imageHeight = 100,
    this.imageWidth = 300,
  }) : super(key: key);
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  bool isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Column(children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                if (widget.subtitle.isNotEmpty)
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFF1AA18F),
                    ),
                  ),
                widget.imagePath.endsWith('.svg')
                    ? SvgPicture.asset(
                        widget.imagePath,
                        width: widget.imageWidth,
                        height: widget.imageHeight,
                      )
                    : Image.asset(
                        widget.imagePath,
                        width: widget.imageWidth,
                        height: widget.imageHeight,
                      ),
              ]),
            ),
            // if (widget.showTermsAndConditions)
            //   Column(children: [
            //     const Text(
            //       'START YOUR',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 30,
            //         color: Colors.black,
            //       ),
            //     ),
            //     const Text(
            //       'THREEFOLD',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 30,
            //         color: Colors.black,
            //       ),
            //     ),
            //     const Text(
            //       'JOURNEY',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 30,
            //         color: Colors.black,
            //       ),
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Checkbox(
            //           value:
            //               isChecked, // Replace with a state variable for real usage
            //           onChanged: (bool? value) {
            //             setState(() {
            //               isChecked = value ?? false;
            //             });
            //           },
            //         ),
            //         const Text("I agree to Threefold's terms and conditions."),
            //       ],
            //     )
            //   ])
            // else
            SizedBox(
              width: 300,
              child: Text(
                widget.description,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
