import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        color: Colors.cyanAccent,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(

          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Paulo Victor Espíndola',
                  style: Theme.of(context).textTheme.firstTitleName,
                ),
                Text(
                  'FLUTTER DEVELOPER - FULL-STACK / FRONT-END',
                  style: Theme.of(context).textTheme.secondSubTitleName,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: Text('version: ${AppConfig.of(context).version}'),),

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
