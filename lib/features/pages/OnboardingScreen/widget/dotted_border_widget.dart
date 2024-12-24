import 'package:animation_app/features/Utils/commonWidget/app_color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedBorderCircleWidget extends StatelessWidget {
  final Widget child;
  const DottedBorderCircleWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  DottedBorder(
      borderType: BorderType.Circle,
      strokeWidth: 2,
      dashPattern: const [3, 2],
      color: Colors.yellowAccent.shade700,
      child: child,
    );
  }
}

class DottedBorderRadiusWidget extends StatelessWidget {
  final String text;
  const DottedBorderRadiusWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      strokeWidth: 2,
      dashPattern: const [3, 2],
      color: Colors.yellowAccent.shade700,
      child : Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),child: Text(text, textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.black))),
    );
  }
}