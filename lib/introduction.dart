import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:labelcheck/functions.dart';
import 'package:labelcheck/main.dart';

List<PageViewModel> pages = [
  PageViewModel(
    title: "Simple",
    body: "Scan Labels to get more Information",
    image: Center(
      child: Image.network(
          'https://raw.githubusercontent.com/phibr0/labelcheck/main/store.png',
          height: 225.0),
    ),
  ),
  PageViewModel(
    footer: OutlineButton(
      child: Text('GitHub'),
      onPressed: () => launchURL('https://github.com/phibr0/labelcheck'),
    ),
    title: 'Open Source',
    body: 'View it on GitHub',
    image: Center(
      child: Image.network(
          'https://raw.githubusercontent.com/phibr0/labelcheck/main/logo.png',
          height: 225.0),
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
