import 'package:animation_app/features/Utils/commonWidget/app_color.dart';
import 'package:animation_app/features/Utils/commonWidget/app_string.dart';
import 'package:animation_app/features/Utils/commonWidget/btn_widget.dart';
import 'package:animation_app/features/pages/LiveClass/live_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'widget/dotted_border_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset(AssetString.studentVideo)
          ..initialize().then((_) {
            setState(() {
              _videoPlayerController.play();
            });
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade100,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Image.asset(
                AssetString.sparkLogo,
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
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Lottie.asset(
                    AssetString.sparkLottie,
                    width: 400, // Adjust size of the Lottie animation
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  if (_videoPlayerController.value.isInitialized)
                    Hero(
                       tag: "girl",
                      child: Container(
                        width: 300, // Outer circle diameter
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.primer,
                            width: 2, // Border thickness
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: AspectRatio(
                              aspectRatio:
                                  _videoPlayerController.value.aspectRatio,
                              child: VideoPlayer(_videoPlayerController),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    ClipOval(
                      child: Container(
                        color: Colors.grey.shade300,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  Positioned(
                    left: 80,
                    top: 29,
                    child: DottedBorderCircleWidget(
                      child: CircleAvatar(
                          radius: 35,
                          child: Image.asset(
                            AssetString.blueBook,
                            width: 50,
                            height: 50,
                          )),
                    ),
                  ),
                  const Positioned(
                    right: 30,
                    top: 90,
                    child: DottedBorderRadiusWidget(
                      text: "Holistic Well-Being",
                    ),
                  ),
                  Positioned(
                    left: 35,
                    bottom: 170,
                    child: DottedBorderCircleWidget(
                      child: CircleAvatar(
                          radius: 20,
                          child: Image.asset(
                            AssetString.preReadSelected,
                            width: 30,
                            height: 30,
                          )),
                    ),
                  ),
                  const Positioned(
                    left: 30,
                    bottom: 90,
                    child: DottedBorderRadiusWidget(
                      text: "Doubt Classification",
                    ),
                  ),
                  const Positioned(
                    right: 30,
                    bottom: 110,
                    child: DottedBorderRadiusWidget(
                      text: "Personalised",
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    right: 60,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: DottedBorderCircleWidget(
                        child: CircleAvatar(
                            radius: 40,
                            child: Image.asset(
                              AssetString.emoji,
                              width: 30,
                              height: 30,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              BtnWidget(
                text: "Next",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LiveScreen()));
                },
              )
            ],
          ),
        ));
  }
}
