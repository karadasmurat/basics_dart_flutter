import 'package:basics_dart/flutter/views/emptyPages.dart';
import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  final pageController = PageController(
    initialPage: 0,
  );

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      const PageWithText(
        backgroundColor: Colors.green,
        text: "Page 1",
      ),
      const PageWithText(
        backgroundColor: Colors.orange,
        text: "Page 2",
      ),
      const PageWithText(text: "Page 3")
    ];
  }

  @override
  void dispose() {
    //discard any resources used by the controller
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            //hoverColor: Colors.red,
            //splashColor: Colors.red,
            iconSize: 50, // default 24
            onPressed: () {
              //check if we are in the first page, to prevent empty scrolling
              if (pageController.page != 0) {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            icon: const Icon(Icons.arrow_left),
          ),
          IconButton(
            iconSize: 50,
            onPressed: () {
              //check if we are in the last page, to prevent empty scrolling
              if (pageController.page != pages.length - 1)
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
            },
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
      backgroundColor: Colors.blue[800],
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
    );
  }
}
