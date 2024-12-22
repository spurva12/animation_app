import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  double _position = 0.0; // Initial position

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _position += details.primaryDelta!;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    // Add snapping effect if swipe is significant
    setState(() {
      if (_position > 100) {
        _position = 200; // Snap to the right
      } else if (_position < -100) {
        _position = -200; // Snap to the left
      } else {
        _position = 0; // Snap back to the start
      }
    });
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
      Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                'Swipe Item $index',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
        itemCount: 5,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    ),
          ],
        ),
      ),
    );
  }
}
