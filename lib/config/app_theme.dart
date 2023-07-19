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

        ]
    );
  }
}