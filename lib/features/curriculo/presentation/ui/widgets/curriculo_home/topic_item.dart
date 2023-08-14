import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';

class TopicItem extends StatelessWidget {
  final String text;
  const TopicItem({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Icon(Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Text(text,
            style: Theme.of(context).textTheme.curriculoStyle,
            overflow: TextOverflow.clip,
            maxLines: 12,
          ),
        )],
    );
  }
}

class GroupItem extends StatelessWidget {
  final String title;
  final List<String> values;
  const GroupItem({
    required this.title,
    required this.values,
    Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: Theme.of(context).textTheme.subtopicTitle,
          ),
          const SizedBox(height: 4,),
         ListView(
           shrinkWrap: true,
           children: values.map((e) => TopicItem(text: e)).toList(),
         )

        ],
      ),
    );
  }
}

