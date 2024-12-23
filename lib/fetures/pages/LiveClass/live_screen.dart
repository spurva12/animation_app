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
    _videoPlayerController1 =
    VideoPlayerController.asset('assets/images/studentvideo.mp4')
      ..initialize().then((_) {
        setState(() {
          _videoPlayerController1.play();
        });
      });
  }
  _videoPlay(){
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.orange.shade100
            //  gradient: _gradient(),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            Image.asset(
              "assets/images/sparkl_logo.png",
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              "1-on-1 Live Classed",
              // textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
            ),
            const Text(
              "Leaning customized for every student",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio:
                  _videoPlayerController1.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController1),
                ),
              ),
            ),
            Flexible(child: Swiper(
              itemWidth: double.infinity,
              itemHeight: 550,
              itemCount: 4,
              loop: true,
              duration: 2000,
              layout: SwiperLayout.STACK,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                return Container(
                  width: double.infinity,
                  height: 550,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage("assets/images/stack_card.png")),
                    borderRadius: BorderRadius.circular(20)
                  ),
                );
              },
            ))

          ],
        ),
      ),
    );
  }
}
