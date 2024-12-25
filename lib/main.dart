import 'package:animation_app/features/Utils/commonWidget/app_string.dart';
import 'package:animation_app/features/pages/OnboardingScreen/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: OnboardingScreen(),
   //   home: PageBuilderExample(),
    );
  }
}
class PageBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        FirstPage(),
        SecondPage(),
      ],
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.asset(
            AssetString.preReadSelected, // Replace with your image URL
            width: 150,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.asset(
            AssetString.preReadSelected, // Replace with your image URL
            width: 300, // Different size to demonstrate the animation
          ),
        ),
      ),
    );
  }
}