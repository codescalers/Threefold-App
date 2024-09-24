import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:threefold_connect/widgets/page1.dart';
import 'package:threefold_connect/widgets/page2.dart';
import 'package:threefold_connect/widgets/page3.dart';
import 'package:threefold_connect/widgets/page4.dart';
import 'package:threefold_connect/widgets/page5.dart';

class SwipePages extends StatefulWidget {
  @override
  _SwipePagesState createState() => _SwipePagesState();
}

class _SwipePagesState extends State<SwipePages> {
  final PageController _pageController =
      PageController(); // Controls the PageView
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Swipe Pages')),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: null,
                  child: SizedBox(
                    child: Text(
                      'SKIP',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                Page1(),
                Page2(),
                Page3(),
                Page4(),
                Page5(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SmoothPageIndicator(
            controller: _pageController,
            count: 5,
            effect: const ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Color(0xFF1AA18F),
              dotColor: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
