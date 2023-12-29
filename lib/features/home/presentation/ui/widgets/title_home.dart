import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/config/app_theme.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    bool isPhoneView = width <= 550;
    return FittedBox(
      child: Container(
        color: const Color(0xff1d256c),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Stack(

          children: [
            SizedBox(
              width: width,
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Animate(
                  child: Text(
                    'Paulo Victor Espíndola',
                    style: Theme.of(context).textTheme.firstTitleName,

                  ),
                ).slide(duration: 1200.ms),
                Text(
                  'FLUTTER DEVELOPER - FULL-STACK',
                  style: Theme.of(context).textTheme.secondSubTitleName,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: Text('version: ${AppConfig.of(context).version}',
                  style: const TextStyle(color: Colors.white),
                  ),),

              ],
          ),
            ),
            //
          ]
        ),
      ),
    );
  }
}
