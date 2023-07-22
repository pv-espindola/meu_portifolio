import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/curriculo/data/text_data.dart';

class IntroductionHome extends StatelessWidget {
  const IntroductionHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Container(
        padding: const EdgeInsets.all(4),
        margin:  const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8,8,8,0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.yellow[200]!)
          ),
          child: Text(introductionValue,
          textAlign: TextAlign.center,
          ),
        ));
  }
}
