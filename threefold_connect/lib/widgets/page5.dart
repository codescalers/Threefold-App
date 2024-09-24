import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threefold_connect/widgets/news_web_view.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Column(children: [
                SvgPicture.asset(
                  'assets/images/journey.svg',
                  width: 200,
                  height: 200,
                )
              ]),
            ),
            Column(children: [
              const Text(
                'STARTYOUR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const Text(
                'THREEFOLD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF1AA18F),
                ),
              ),
              const Text(
                'JOURNEY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WebView()),
                      );
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF1AA18F))),
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "I agree to Threefold's ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Terms and conditions.",
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Terms and Conditions"),
                                  content: const Text(
                                      "Here are the terms and conditions..."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Close"),
                                    ),
                                  ],
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
