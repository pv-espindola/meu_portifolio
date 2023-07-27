import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: FittedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.hello),
            Text('Paulo Victor Espíndola',
            style: Theme.of(context).textTheme.firstTitleName,
            ),
            Text('FLUTTER DEVELOPER - FULL-STACK / FRONT-END',
              style: Theme.of(context).textTheme.secondSubTitleName,
            )

          ],
        ),
      ),
    );
  }
}
