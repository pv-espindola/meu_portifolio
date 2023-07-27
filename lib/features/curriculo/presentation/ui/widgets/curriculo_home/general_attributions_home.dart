import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'topic_item.dart';

class GeneralAttributionsHome extends StatelessWidget {
  const GeneralAttributionsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String generalAttributionsTitle =
        AppLocalizations.of(context)!.generalAttributionsTitle;
    String attributionsValue1 =
        AppLocalizations.of(context)!.attributionsValue1;
    String attributionsValue2 =
        AppLocalizations.of(context)!.attributionsValue2;
    String attributionsValue3 =
        AppLocalizations.of(context)!.attributionsValue3;
    String attributionsValue4 =
        AppLocalizations.of(context)!.attributionsValue4;
    String attributionsValue5 =
        AppLocalizations.of(context)!.attributionsValue5;
    final values = [attributionsValue1, attributionsValue2, attributionsValue3, attributionsValue4, attributionsValue5];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(left: 4, bottom: 12),
        child: Text(
          generalAttributionsTitle.toUpperCase(),
          style: Theme.of(context).textTheme.topicTitle,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: values.map((e) => TopicItem(text: e)).toList(),
      )
    ]);
  }
}
