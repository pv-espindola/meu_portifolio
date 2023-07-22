import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';

import 'topic_item.dart';

class GeneralAttributionsHome extends StatelessWidget {
  const GeneralAttributionsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(left: 4, bottom: 12),
        child: Text(
          'ATRIBUICÕES GERAIS',
          style: Theme.of(context).textTheme.topicTitle,
        ),
      ),
      const TopicItem(text: '''Todo o desenvolvimento de front-end baseado em premissas de clean code e arquitetura MVC/MVVM.'''
      ),
      const TopicItem(text: '''Executar e planejar o desenvolvimento das funcionalidades complexas.'''
      ),
      const TopicItem(text: '''Propor evoluções tecnológicas nos sistemas.'''
      ),
      const TopicItem(text: '''Coordenar o desenvolvimento junto ao backend, designer e gerente de produto.'''
      ),
      const TopicItem(text: '''Utilizar ferramentas de versionamento(GIT) e métodos ágeis(SCRUM).'''
      ),




    ]);
  }
}
