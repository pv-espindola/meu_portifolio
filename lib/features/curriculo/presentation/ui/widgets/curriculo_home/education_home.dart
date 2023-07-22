import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:meu_portifolio/features/curriculo/data/text_data.dart';
import 'package:meu_portifolio/features/curriculo/presentation/ui/widgets/curriculo_home/topic_item.dart';

class EducationHome extends StatelessWidget {
  const EducationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(left: 4),
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ESCOLARIDADE',
          style: Theme.of(context).textTheme.topicTitle,
          ),
          const SizedBox(height: 8,),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopicItem(text: educationValue1),
                TopicItem(text: educationValue2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
