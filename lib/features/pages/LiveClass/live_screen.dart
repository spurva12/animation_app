import 'package:animation_app/features/Utils/commonWidget/app_color.dart';
import 'package:animation_app/features/Utils/commonWidget/app_string.dart';
import 'package:animation_app/features/Utils/commonWidget/btn_widget.dart';
import 'package:animation_app/features/pages/ChatClass/chat_screen.dart';
import 'package:animation_app/features/pages/OnboardingScreen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;

  @override
  void initState() {
    super.initState();
    _videoPlay();
  }

  _videoPlay() {
    _videoPlayerController1 =
    VideoPlayerController.asset(AssetString.teacherVideo)
      ..initialize().then((_) {
        setState(() {
          _videoPlayerController1.play();
        });
      });
    _videoPlayerController2 =
    VideoPlayerController.asset(AssetString.studentVideo)
      ..initialize().then((_) {
        setState(() {
          _videoPlayerController2.play();
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Column(
        children: [
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.09),
          Image.asset(
            AssetString.sparkLogo,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.3,
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          const Text(
            "1-on-1 Live Classed",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          ),
          const Text(
            "Leaning customized for every student",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          Container(
            width: 200,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(15) // Adjust the radius as needed
            ),
            child: AspectRatio(
              aspectRatio: _videoPlayerController1.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController1),
            ),
          ),
          _stackCardWidget(),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  width: 60,
                  height: 60,
                  child: CircularStepProgressIndicator(
                    selectedColor: AppColor.primer,
                    unselectedColor: AppColor.grey,
                      totalSteps: 3,
                      currentStep: 2,
                      width: 100,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnboardingScreen(),
                              ),
                            );
                          }, icon: Icon(Icons.arrow_back_outlined)),
                  ),
                ),
              ),

              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02,),
              Flexible(
                flex: 8,
                child: BtnWidget(
                  text: "Next",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _stackCardWidget() {
    return Flexible(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Swiper(
            itemWidth: MediaQuery
                .of(context)
                .size
                .width * 1,
            itemHeight: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            itemCount: 3,
            loop: true,
            duration: 500,
            layout: SwiperLayout.STACK,
            scrollDirection: Axis.vertical,
            curve: Curves.easeInOut,
            itemBuilder: (context, index) {
              return SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 1,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,
                  child: Image.asset("assets/images/stack_card.png"));
            },
          ),
          Positioned(
            bottom: 80,
            child: Hero(
              tag: "girl",
              child: Container(
                width: 80, // Outer circle diameter
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController2.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController2),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
