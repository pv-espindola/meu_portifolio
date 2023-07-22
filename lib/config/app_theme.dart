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
      textTheme: TextTheme()
    );
  }
}

extension ThemeDataExtension on TextTheme {
  TextStyle get firstTitleName => const TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
      letterSpacing: 12,
  );

  TextStyle get secondSubTitleName => const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  TextStyle get topicTitle => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 4
  );
  TextStyle get subtopicTitle => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );






}