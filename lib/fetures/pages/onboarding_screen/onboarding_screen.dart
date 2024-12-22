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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Image.asset(
            "assets/images/sparkl_logo.png",
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Text(
            "Leaning Made Personal",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          ),
          const Text(
            "A Program designed just for YOU!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
          ),
          // VideoPlayer(_videoPlayerController),
          Padding(
            padding: EdgeInsets.all(8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 16,
                  right: 0,
                  bottom: 65,
                  child: CircleAvatar(
                    radius: 140,
                    backgroundColor: Colors.yellow.shade500,
                    child: CircleAvatar(
                      radius: 138,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 137,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Container(height: 400, width: 900, child: Lottie.asset("assets/images/sparkl_shape_shift_lottie.json", fit: BoxFit.cover)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 18)),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow.shade800), //Background Color
                  elevation: MaterialStateProperty.all(3), //Defines Elevation
                  shadowColor: MaterialStateProperty.all(Colors.yellow.shade800), //Defines shadowColor
                ),
                onPressed: () {},
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )),
          )
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
