import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'topic_item.dart';

class SkillsHome extends StatelessWidget {
  const SkillsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            'Habilidades e Competencias'.toUpperCase(),
            style: Theme.of(context).textTheme.topicTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Linguagens de Programação',
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
        const GroupItem(
            title: 'Tecnologias e Frameworks',
            values: ['Flutter', 'Firebase Products', 'HTML/CSS']),
        const SizedBox(
          height: 8,
        ),
        const GroupItem(
            title: 'Banco de dados',
            values: ['SQL (sqflite)', 'NOSQL ( Hive, ObjectBox) ']),
        const SizedBox(
          height: 8,
        ),
        const GroupItem(
            title: 'Edição de midias',
            values: ['Edição de vídeos e imagens']),
        const SizedBox(
          height: 8,
        ),
        const GroupItem(
            title: 'Idiomas',
            values: ['Inglês avançado/fluente']),

      ],
    );
  }
}
