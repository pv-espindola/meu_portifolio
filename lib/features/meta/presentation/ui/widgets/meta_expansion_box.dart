import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';

class MetaExpansionBox extends StatelessWidget {
  final String title;
  final String value;

  const MetaExpansionBox({required this.title, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = List.castFrom([
      const Color(0xffDFA613),
      const Color(0xffDC7FB2),
      const Color(0xffAD63BB),
    ].map((e) => e.withOpacity(.9)).toList());

    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.purpleAccent,
            gradient: LinearGradient(
              colors: colors,
              tileMode: TileMode.mirror,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
        child: ExpansionTile(
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
          children: [

            Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.metaBoxTitle,
                )),
          ]),
        );
  }
}
