import 'package:flutter/material.dart';

enum LanguageApp {
  en,
  tr,
  pl,
  es,
  pt,
  ind,
  de,
  fr,
  it,
  ko,
  enGb,
  phoneLanguage
}

class L10n {
  static const List<Locale> support = [
    Locale("pt"),
    Locale("en"),
    // Locale("es"),

    // Locale("tr")
  ];
}

class LanguageSelector {
  final String text;

  final String? extension;
  const LanguageSelector({required this.text, this.extension});

  factory LanguageSelector.fromLocale(Locale locale) {
    String language = locale.languageCode;

    String getLanguage(String localeLanguage) {
      Map<String, String> map = {
        'pt': 'Português',
        'en': 'English',
        // 'es': 'Español',
        // 'tr': 'Türk'
      };
      return map[localeLanguage] ?? 'Error';
    }

    return LanguageSelector(text: getLanguage(language), extension: language);
  }
}

class TranslationProvider with ChangeNotifier {
  String? _phoneLanguage;
  String? _selectedLanguage;

  final Locale defaultLanguage = const Locale('pt');

  LanguageSelector? _itemSelected;

  LanguageSelector get itemSelected => _itemSelected ?? items.first;

  Locale? _locale;
  Locale get locale => _locale ?? defaultLanguage;
  void setLocale(Locale loc) {
    if (!L10n.support.contains(loc)) {
      _locale = defaultLanguage;
    } else {
      _locale = loc;
    }
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

  List<LanguageSelector> items = [
    const LanguageSelector(text: "Default"),
    for (Locale item in L10n.support) LanguageSelector.fromLocale(item)
  ];

  void setSelected(LanguageSelector? selected) {
    print('Language ${selected!.text}');
    _itemSelected = selected;
  }

  String get languageAppExtension =>
      _selectedLanguage ?? _phoneLanguage ?? defaultLanguage.languageCode;

  void getLanguagePhone(String language) {
    _phoneLanguage = getLanguage(language);
  }

  void setLanguage() {
    _selectedLanguage =
        items.firstWhere((element) => element == _itemSelected).extension;
    if (_selectedLanguage != null) {
      setLocale(Locale('$_selectedLanguage'));
      debugPrint(_locale?.languageCode);
    } else {
      clearLocale();
    }
  }

  String getLanguage(String languageCode) {
    return items.any((e) => e.extension?.contains(languageCode) ?? false)
        ? languageCode
        : defaultLanguage.languageCode;
  }
}

// const kSupportedLocales = [
//   Locale('en', 'AG'), // English (Antigua and Barbuda)
//   Locale('en', 'AI'), // English (Anguilla)
//   Locale('en', 'AS'), // English (American Samoa)
//   Locale('en', 'AU'), // English (Australia)
//   Locale('en', 'BB'), // English (Barbados)
//   Locale('en', 'BE'), // English (Belgium)
//   Locale('en', 'BM'), // English (Bermuda)
//   Locale('en', 'BS'), // English (Bahamas)
//   Locale('en', 'BW'), // English (Botswana)
//   Locale('en', 'BZ'), // English (Belize)
//   Locale('en', 'CA'), // English (Canada)
//   Locale('en', 'CC'), // English (Cocos (Keeling) Islands)
//   Locale('en', 'CK'), // English (Cook Islands)
//   Locale('en', 'CM'), // English (Cameroon)
//   Locale('en', 'CX'), // English (Christmas Island)
//   Locale('en', 'DG'), // English (Diego Garcia)
//   Locale('en', 'DM'), // English (Dominica)
//   Locale('en', 'ER'), // English (Eritrea)
//   Locale('en', 'FJ'), // English (Fiji)
//   Locale('en', 'FK'), // English (Falkland Islands (Islas Malvinas))
//   Locale('en', 'FM'), // English (Micronesia)
//   Locale('en', 'GB'), // English (United Kingdom)
//   Locale('en', 'GD'), // English (Grenada)
//   Locale('en', 'GG'), // English (Guernsey)
//   Locale('en', 'GH'), // English (Ghana)
//   Locale('en', 'GI'), // English (Gibraltar)
//   Locale('en', 'GM'), // English (Gambia)
//   Locale('en', 'GU'), // English (Guam)
//   Locale('en', 'GY'), // English (Guyana)
//   Locale('en', 'HK'), // English (Hong Kong)
//   Locale('en', 'IE'), // English (Ireland)
//   Locale('en', 'IM'), // English (Isle of Man)
//   Locale('en', 'IN'), // English (India)
//   Locale('en', 'IO'), // English (British Indian Ocean Territory)
//   Locale('en', 'JE'), // English (Jersey)
//   Locale('en', 'JM'), // English (Jamaica)
//   Locale('en', 'KE'), // English (Kenya)
//   Locale('en', 'KI'), // English (Kiribati)
//   Locale('en', 'KN'), // English (Saint Kitts and Nevis)
//   Locale('en', 'KY'), // English (Cayman Islands)
//   Locale('en', 'LC'), // English (Saint Lucia)
//   Locale('en', 'LR'), // English (Liberia)
//   Locale('en', 'LS'), // English (Lesotho)
//   Locale('en', 'MG'), // English (Madagascar)
//   Locale('en', 'MH'), // English (Marshall Islands)
//   Locale('en', 'MO'), // English (Macau)
//   Locale('en', 'MP'), // English (Northern Mariana Islands)
//   Locale('en', 'MS'), // English (Montserrat)
//   Locale('en', 'MT'), // English (Malta)
//   Locale('en', 'MU'), // English (Mauritius)
//   Locale('en', 'MW'), // English (Malawi)
//   Locale('en', 'NA'), // English (Namibia)
//   Locale('en', 'NF'), // English (Norfolk Island)
//   Locale('en', 'NG'), // English (Nigeria)
//   Locale('en', 'NR'), // English (Nauru)
//   Locale('en', 'NU'), // English (Niue)
//   Locale('en', 'NZ'), // English (New Zealand)
//   Locale('en', 'PG'), // English (Papua New Guinea)
//   Locale('en', 'PH'), // English (Philippines)
//   Locale('en', 'PK'), // English (Pakistan)
//   Locale('en', 'PN'), // English (Pitcairn Islands)
//   Locale('en', 'PR'), // English (Puerto Rico)
//   Locale('en', 'PW'), // English (Palau)
//   Locale('en', 'RW'), // English (Rwanda)
//   Locale('en', 'SB'), // English (Solomon Islands)
//   Locale('en', 'SC'), // English (Seychelles)
//   Locale('en', 'SD'), // English (Sudan)
//   Locale('en', 'SG'), // English (Singapore)
//   Locale('en', 'SH'), // English (Saint Helena)
//   Locale('en', 'SL'), // English (Sierra Leone)
//   Locale('en', 'SS'), // English (South Sudan)
//   Locale('en', 'SX'), // English (Sint Maarten)
//   Locale('en', 'SZ'), // English (Swaziland)
//   Locale('en', 'TC'), // English (Turks and Caicos Islands)
//   Locale('en', 'TK'), // English (Tokelau)
//   Locale('en', 'TO'), // English (Tonga)
//   Locale('en', 'TT'), // English (Trinidad and Tobago)
//   Locale('en', 'TV'), // English (Tuvalu)
//   Locale('en', 'TZ'), // English (Tanzania)
//   Locale('en', 'UG'), // English (Uganda)
//   Locale('en', 'UM'), // English (U.S. Outlying Islands)
//   Locale('en', 'US'), // English (United States)
//   Locale('en', 'US'), // English (United States,Computer)
//   Locale('en', 'VC'), // English (St. Vincent & Grenadines)
//   Locale('en', 'VG'), // English (British Virgin Islands)
//   Locale('en', 'VI'), // English (U.S. Virgin Islands)
//   Locale('en', 'VU'), // English (Vanuatu)
//   Locale('en', 'WS'), // English (Samoa)
//   Locale('en', 'ZA'), // English (South Africa)
//   Locale('en', 'ZM'), // English (Zambia)
//   Locale('en', 'ZW'), // English (Zimbabwe)

//   Locale('es', 'AR'), // Spanish (Argentina)
//   Locale('es', 'BO'), // Spanish (Bolivia)
//   Locale('es', 'CL'), // Spanish (Chile)
//   Locale('es', 'CO'), // Spanish (Colombia)
//   Locale('es', 'CR'), // Spanish (Costa Rica)
//   Locale('es', 'CU'), // Spanish (Cuba)
//   Locale('es', 'DO'), // Spanish (Dominican Republic)
//   Locale('es', 'EA'), // Spanish (Ceuta and Melilla)
//   Locale('es', 'EC'), // Spanish (Ecuador)
//   Locale('es', 'ES'), // Spanish (Spain)
//   Locale('es', 'GQ'), // Spanish (Equatorial Guinea)
//   Locale('es', 'GT'), // Spanish (Guatemala)
//   Locale('es', 'HN'), // Spanish (Honduras)
//   Locale('es', 'IC'), // Spanish (Canary Islands)
//   Locale('es', 'MX'), // Spanish (Mexico)
//   Locale('es', 'NI'), // Spanish (Nicaragua)
//   Locale('es', 'PA'), // Spanish (Panama)
//   Locale('es', 'PE'), // Spanish (Peru)
//   Locale('es', 'PH'), // Spanish (Philippines)
//   Locale('es', 'PR'), // Spanish (Puerto Rico)
//   Locale('es', 'PY'), // Spanish (Paraguay)
//   Locale('es', 'SV'), // Spanish (El Salvador)
//   Locale('es', 'US'), // Spanish (United States)
//   Locale('es', 'UY'), // Spanish (Uruguay)
//   Locale('es', 'VE'), // Spanish (Venezuela)

//   Locale('fr', ''), // French
//   Locale('in', ''), // Indonesian
//   Locale('it', ''), // Italian
//   Locale('pl', ''), // Polish
//   Locale('pt', ''), // Portuguese
//   Locale('ro', ''), // Romanian
//   Locale('tr', ''), // Turkish
// ];
