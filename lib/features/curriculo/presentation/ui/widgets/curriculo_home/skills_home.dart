import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'topic_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SkillsHome extends StatelessWidget {
  const SkillsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String skillsTitle = AppLocalizations.of(context)!.skillsTitle;
    String skillsTopicValue1 = AppLocalizations.of(context)!.skillsTopicValue1;
    String skillsTopicValue2 = AppLocalizations.of(context)!.skillsTopicValue2;
    String skillsTopicValue3 = AppLocalizations.of(context)!.skillsTopicValue3;
    String skillsTopicValue4 = AppLocalizations.of(context)!.skillsTopicValue4;
    String skillsTopicValue5 = AppLocalizations.of(context)!.skillsTopicValue5;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            skillsTitle.toUpperCase(),
            style: Theme.of(context).textTheme.topicTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skillsTopicValue1,
                style: Theme.of(context).textTheme.subtopicTitle,
              ),
              const SizedBox(
                height: 4,
              ),
              TopicItem(text: 'Java'),
              TopicItem(text: 'Dart'),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
         GroupItem(
            title: skillsTopicValue2,
            values: const ['Flutter', 'Firebase Products', 'REST API']),
        const SizedBox(
          height: 8,
        ),
        GroupItem(
            title: skillsTopicValue3,
            values: const ['SQL (sqflite)', 'NOSQL ( Hive, ObjectBox) ']),
        const SizedBox(
          height: 8,
        ),
        GroupItem(
            title: skillsTopicValue4,
            values: const ['Edição de vídeos e imagens']),
        const SizedBox(
          height: 8,
        ),
         GroupItem(
            title: skillsTopicValue5,
            values: const ['Inglês avançado/fluente']),

      ],
    );
  }
}
