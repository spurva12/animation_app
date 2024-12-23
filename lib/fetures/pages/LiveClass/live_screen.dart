import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
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
        VideoPlayerController.asset('assets/images/studentvideo.mp4')
          ..initialize().then((_) {
            setState(() {
              _videoPlayerController1.play();
            });
          });
    _videoPlayerController2 =
        VideoPlayerController.asset('assets/images/studentvideo.mp4')
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
      backgroundColor:  Colors.orange.shade100,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Image.asset(
            "assets/images/sparkl_logo.png",
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Text(
            "1-on-1 Live Classed",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          ),
          const Text(
            "Leaning customized for every student",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            width: 150,
            height: 120,
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
        ],
      ),
    );
  }

  _stackCardWidget(){
    return Swiper(
      itemWidth: MediaQuery.of(context).size.width * 1,
      itemHeight: MediaQuery.of(context).size.height * 0.4,
      itemCount: 3,
      loop: true,
      duration: 500,
      layout: SwiperLayout.STACK,
      scrollDirection: Axis.vertical,
      curve: Curves.easeInOut,
      itemBuilder: (context, index) {
        return SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset("assets/images/stack_card.png"));

      },
    );
  }
}
