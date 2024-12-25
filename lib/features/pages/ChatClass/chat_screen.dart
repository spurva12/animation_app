import 'package:animation_app/features/Utils/commonWidget/app_color.dart';
import 'package:animation_app/features/Utils/commonWidget/app_string.dart';
import 'package:animation_app/features/Utils/commonWidget/btn_widget.dart';
import 'package:animation_app/features/pages/LiveClass/live_screen.dart';
import 'package:animation_app/features/pages/OnboardingScreen/onboarding_screen.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            "Doubt Resolution with Teachers",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          _receivedChatWidget(text: "Do you want to go over how to apply the quadratic formula",),
          _sendChatWidget(text : "Yes, I'm coonfused about when to use it."),
          _receivedChatWidget(text: "Do you want to go over how to apply the quadratic formula",),
          _btnWidget(),
        ],
      ),
    );
  }


  _receivedChatWidget({required String text}){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: BubbleSpecialThree(
            text: text,
            color: Colors.yellow.shade700,
            tail: true,
            isSender: false,
          ),
        ),
        Positioned(
          top: -15,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: _videoPlayerController1.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController1),
              ),
            ),
          ),
        )
      ],
    );
  }
  _sendChatWidget({required String text}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: BubbleSpecialThree(
              text: text,
              color: Colors.white,
              tail: true,
              isSender: true,
            ),
          ),
          Positioned(
            right: 0,
            top: -15,
            child: Container(
              width: 40,
              height: 40,
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
          )
        ],
      ),
    );
  }
  _btnWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
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
                currentStep: 3,
                width: 100,
                child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveScreen(),
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
              text: "Get Started",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OnboardingScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
