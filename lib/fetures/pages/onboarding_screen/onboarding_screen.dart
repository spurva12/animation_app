import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
/*  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/images/studentvideo.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.orange.shade100
          //  gradient: _gradient(),
          ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Image.asset(
            "assets/images/sparkl_logo.png",
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            "Leaning Made Personal",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          ),
          Text(
            "A Program designed just for YOU!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
          ),
          // VideoPlayer(_videoPlayerController),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Lottie.asset("assets/images/sparkl_shape_shift_lottie.json"),
              CircleAvatar(
                  radius: 120,
                  backgroundColor: Colors.yellow.shade500,
                  child: CircleAvatar(
                    radius: 116,
                    backgroundColor: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    ));
  }

  RadialGradient _gradient() {
    return RadialGradient(
      center: Alignment.topCenter,
      radius: 0.2,
      colors: [
        Colors.green,
        Colors.yellow.shade50,
      ],
    );
  }
}
