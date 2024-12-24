import 'package:flutter/material.dart';
import 'app_color.dart';

class BtnWidget extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const BtnWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.primer,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        margin: const EdgeInsets.all(15),
        padding: EdgeInsets.all(16),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.black),
        ),
      ),
    );
  }
}
