import 'package:flutter/material.dart';

class EmptySign extends StatelessWidget {
  const EmptySign({Key? key}) : super(key: key);
  final String imagePath = 'assets/images/empty.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(imagePath))),

    );
  }
}
