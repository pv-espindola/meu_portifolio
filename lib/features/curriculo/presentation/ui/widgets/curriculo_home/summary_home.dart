import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'topic_item.dart';

class SummaryHome extends StatelessWidget {
  const SummaryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value1 = '''
    Profissional de TI com formação em Sistemas da Informação pelo Cotemig e especialização em linguagem Java pela Oracle. Possui experiência como técnico de TI e posteriormente empreendeu na área de academias. Retornou ao desenvolvimento e aprimorou habilidades em Front-end, incluindo HTML, PHP, CSS, JavaScript, UI/UX e desenvolvimento web.
''';

    String value2 = '''
    Descobriu a paixão por Flutter em 2020, tornando-se um profissional Full-Stack capaz de desenvolver aplicações mobile do zero ao produto final. Na Exacology, atuou como desenvolvedor Android, assumindo responsabilidades de um Senior após sua saída. Procura novas oportunidades para aplicar suas habilidades em projetos desafiadores.
''';

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              'RESUMO',
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
