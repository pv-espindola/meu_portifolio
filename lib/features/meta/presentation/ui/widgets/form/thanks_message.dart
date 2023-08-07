import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';

class ThanksMessage extends StatelessWidget {
  const ThanksMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Center(

          child: Container(
            width: 200,
            padding: const EdgeInsets.only(top: 16),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.55)),
            child:



            Text(
              'Obrigado...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.thanksStyle,
            ),
          ),
        ),

        Center(
          child: Container(
            height: 250,
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            margin: const EdgeInsets.only(top: 16, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                  image: AssetImage('assets/images/cat_thanks.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),

      ],
    );
  }
}
