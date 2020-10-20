import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:labelcheck/main.dart';

List<PageViewModel> pages = [
  PageViewModel(
    title: "Title of first page",
    body: "description",
    image: Center(
      child: Image.network("", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "Title of second page",
    body: "description",
    image: Center(
      child: Image.network("", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "Title of third page",
    body: "description",
    image: Center(
      child: Image.network("", height: 175.0),
    ),
  ),
];

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MediaQueryProvider(),
          ),
        );
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      done: const Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).accentColor,
        color: Theme.of(context).textTheme.bodyText1.color,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
