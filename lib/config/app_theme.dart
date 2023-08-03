import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get theme {
    return ThemeData(


        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),
        useMaterial3: true,
        extensions: const <ThemeExtension<dynamic>>[

        ],
      textTheme: const TextTheme(),

    );
  }
}

extension ThemeDataExtension on TextTheme {

  TextStyle get curriculoStyle => const TextStyle(
    fontFamily: 'Montserrat',
  );


  TextStyle get firstTitleName => curriculoStyle.copyWith(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    letterSpacing: 8,
    color: const Color(0xff888a9d)
  );

  TextStyle get secondSubTitleName => curriculoStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w400,
      color: const Color(0xff575a6f)
  );

  TextStyle get topicTitle => curriculoStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 4
  );
  TextStyle get subtopicTitle => curriculoStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  TextStyle get metaStyle => const TextStyle(
    fontFamily: 'Arial',
  );

  TextStyle get metaBoxTitle => metaStyle.copyWith(
    fontSize: 15,

  );


}

