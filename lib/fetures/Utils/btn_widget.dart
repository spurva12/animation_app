import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  final void Function()? onPressed;
  const BtnWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 18)),
            backgroundColor: WidgetStateProperty.all(
                Colors.yellow.shade800), //Background Color
            elevation: WidgetStateProperty.all(3), //Defines Elevation
            shadowColor: WidgetStateProperty.all(
                Colors.yellow.shade800), //Defines shadowColor
          ),
          onPressed: onPressed,
           /*   () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LiveScreen()));
          },*/
          child: const Text(
            "Next",
            style:
            TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )),
    );
  }
}
