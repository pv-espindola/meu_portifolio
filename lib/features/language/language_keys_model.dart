

import 'presentation/provider/translation_provider.dart';

class LanguageKeysModel {
  final String order, name, interest, category, type;

  const LanguageKeysModel(
      {required this.order,
      required this.name,
      required this.interest,
      required this.category,
      required this.type});

  factory LanguageKeysModel.fromLanguage(LanguageApp language) {
    String order, name, interest, category, type;

    switch (language) {
      case LanguageApp.de:
        order = 'order_de';
        name = 'name_de';
        interest = 'interest_de';
        category = 'category_de';
        type = 'type_de';
        break;
      case LanguageApp.enGb:
        order = 'order_en_gb';
        name = 'name_en_gb';
        interest = 'interest_en_gb';
        category = 'category_en_gb';
        type = 'type_en_gb';
        break;
      case LanguageApp.es:
        order = 'order_es';
        name = 'name_es';
        interest = 'interest_es';
        category = 'category_es';
        type = 'type_es';
        break;
      case LanguageApp.fr:
        order = 'order_fr';
        name = 'name_fr';
        interest = 'interest_fr';
        category = 'category_fr';
        type = 'type_fr';
        break;
      case LanguageApp.ind:
        order = 'order_id';
        name = 'name_ind';
        interest = 'interest_ind';
        category = 'category_ind';
        type = 'type_ind';
        break;
      case LanguageApp.it:
        order = 'order_it';
        name = 'name_it';
        interest = 'interest_it';
        category = 'category_it';
        type = 'type_it';
        break;
      case LanguageApp.ko:
        order = 'order_ko';
        name = 'name_ko';
        interest = 'interest_ko';
        category = 'category_ko';
        type = 'type_ko';
        break;
      case LanguageApp.pl:
        order = 'order_pl';
        name = 'name_pl';
        interest = 'interest_pl';
        category = 'category_pl';
        type = 'type_pl';
        break;
      case LanguageApp.pt:
        order = 'order_pt';
        name = 'name_pt';
        interest = 'interest_pt';
        category = 'category_pt';
        type = 'type_pt';
        break;
      case LanguageApp.tr:
        order = 'order_tr';
        name = 'name_tr';
        interest = 'interest_tr';
        category = 'category_tr';
        type = 'type_tr';
        break;

      default:
        order = 'order_en';
        name = 'name_en';
        interest = 'interest_en';
        category = 'category_en';
        type = 'type_en';
        break;
    }
    return LanguageKeysModel(
        order: order,
        name: name,
        interest: interest,
        category: category,
        type: type);
  }

  static decodeLanguage(String value) {
    const Map map = {
      'en': LanguageApp.en, // English
      'es': LanguageApp.es, // Spanish
      'fr': LanguageApp.fr, // French
      'in': LanguageApp.ind, // Indonesian
      'it': LanguageApp.it, // Italian
      'pl': LanguageApp.pl, // Polish
      'pt': LanguageApp.pt, // P// Romanian
      'tr': LanguageApp.tr, // Turkish
    };
    return map[value] ?? LanguageApp.en;
  }
}
