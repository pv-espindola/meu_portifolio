import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:meu_portifolio/features/curriculo/data/text_data.dart';

class ProjectsHome extends StatelessWidget {
  const ProjectsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              'PROJETOS',
              style: Theme.of(context).textTheme.topicTitle,
            ),
          ),
          const SizedBox(height: 12,),
          ProjectItem(title: projectTitle1,
              value: projectValue1,
              type: ProjectType.frontEnd),
          ProjectItem(title: projectTitle2, value: projectValue2, type: ProjectType.fullStack)
        ],
      ),
    );
  }
}
enum ProjectType {fullStack, frontEnd }

class ProjectItem extends StatelessWidget {
  final String title;
  final String value;
  final ProjectType type;

  const ProjectItem({
    required this.title,
    required this.value,
    required this.type,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints(
        maxWidth: 700,
        minWidth: 400
      ),

      child: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 4, bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getType(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12,),
                  Text(title),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
                const SizedBox(width: 16,),
                Text(value)],
            ),
          ],
        ),
      ),
    );
  }

  String getType(){
    switch(type){
      case ProjectType.fullStack: return 'Full-Stack';
      case ProjectType.frontEnd: return 'Front-End';
    }
  }
}

