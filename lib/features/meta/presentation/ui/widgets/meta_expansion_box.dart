import 'package:flutter/material.dart';

class MetaExpansionBox extends StatelessWidget {
  String title;
  final String? value;
  final Gradient? gradient;
  final Widget? child;
  final Icon? icon;

  MetaExpansionBox({
    this.gradient,
    this.child,
    this.icon,
    required this.title, this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.purpleAccent,
            gradient: gradient!,
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Container(
            width: 40,
            height: 30,
            // padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 4),
             margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    Color(0xff807878),
                  ],
                  stops: [0, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: FittedBox(child: Text(title)),
          ),
          trailing: icon,
          children: [child!]

        ),
        );
  }
}
