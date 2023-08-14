import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/theme_extensions/gradient_extension.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      useMaterial3: true,
      extensions: <ThemeExtension<dynamic>>[
        GradientExtension(),
      ],
      textTheme: const TextTheme(),

    pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    },
    ),


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
      color: const Color(0xff888a9d));

  TextStyle get secondSubTitleName => curriculoStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: const Color(0xff575a6f));

  TextStyle get topicTitle => curriculoStyle.copyWith(
      fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 4);

  TextStyle get subtopicTitle => curriculoStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  TextStyle get likableStyle => const TextStyle(
      color: Colors.indigo,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      decorationColor: Colors.indigo
  );



  TextStyle get metaStyle => const TextStyle(
        fontFamily: 'Arial',
      );

  TextStyle get metaBoxTitle => metaStyle.copyWith(
        fontSize: 15,
      );

  TextStyle get formHeadStyle => metaStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );


  TextStyle get thanksStyle => TextStyle(
      fontFamily: 'Borel',
      fontSize: 36,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      color: Colors.indigo[900]);

  TextStyle get layoutSizeControlStyleOff => TextStyle(
      fontFamily: 'Borel',
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.indigo[900]);

  TextStyle get layoutSizeControlStyleOn => TextStyle(
      fontFamily: 'Borel',
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: Colors.indigo[300]);




}
