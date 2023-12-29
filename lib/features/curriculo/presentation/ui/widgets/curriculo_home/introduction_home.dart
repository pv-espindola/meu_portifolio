import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:meu_portifolio/config/tools/seo_text.dart';


class IntroductionHome extends StatelessWidget {
  const IntroductionHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  String introductionValue = AppLocalizations.of(context)!.introductionValue;

    return Container(
        padding: const EdgeInsets.all(4),
        margin:  const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8,8,8,0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.yellow[200]!)
          ),
          child: SeoText(
            textAlign: TextAlign.center,
            text: introductionValue,
            valueRenderStyle: 0,
            textStyle: Theme.of(context).textTheme.curriculoStyle,
          ),
        ));
  }
}
