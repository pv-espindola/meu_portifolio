import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'topic_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummaryHome extends StatelessWidget {
  const SummaryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String summaryTitle = AppLocalizations.of(context)!.summaryTitle;
    String value1 = AppLocalizations.of(context)!.summaryValue1;
    String value2 = AppLocalizations.of(context)!.summaryValue2;

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              summaryTitle.toUpperCase(),
              style: Theme.of(context).textTheme.topicTitle,
            ),
          ),
          TopicItem(
            text: value1,
          ),
          TopicItem(text: value2),
        ],
      ),
    );
  }
}
