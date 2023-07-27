import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/translation_provider.dart';

/// Languages allowed for psicometrica release version [Spanish, portuguese, polish, Turkish, English]
class LanguagesAvailable {
  final List<String> valuesAllowed;

  const LanguagesAvailable(
      {this.valuesAllowed = const ['en', 'es', 'pt', 'tr']});

  String selectLanguage(languageCode) =>
      valuesAllowed.contains(languageCode) ? languageCode : 'en';

  String get testLanguage => 'tr';
}

class TranslatableString {
  final String baseValue;
  final Map<String, String?>? translations;

  const TranslatableString(
    this.baseValue, {
    this.translations,
  });

  final LanguagesAvailable languagesAvailable = const LanguagesAvailable();

  /// Parses the `map` argument searching for all keys that starts with
  /// `prefix`, like `description_pt`, and store `baseValue` and
  /// `translations` map.
  factory TranslatableString.fromMap(
    Map<String, dynamic> map, {
    // jsonMap
    required String prefix, // 'description'
  }) {
    final Map<String, String?> t = {};
    for (var e in map.keys) {
      if (e.startsWith(prefix)) {
        if (e != prefix) {
          final splitted = e.split('_');
          t.addAll({
            splitted[1]: map[e],
          });
        } else {
          t.addAll({'default': map[e]});
        }
      }
    }
    return TranslatableString(map[prefix]??'', translations: t);
  }

  /// Get the translated string based on the current locale.
  String translate(BuildContext context) {
    /// Get language from provider
    final languageCode =
        context.read<TranslationProvider>().languageAppExtension;

    final String? value =
        translations?[languagesAvailable.selectLanguage(languageCode)];
    if (value != null && value.isNotEmpty) return value;

    return translations?['default'] ?? '';
  }

  @override
  String toString() => baseValue;
}
