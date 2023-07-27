import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/language/provider/translation_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelectorButton extends StatefulWidget {
  const LanguageSelectorButton({Key? key}) : super(key: key);

  @override
  State<LanguageSelectorButton> createState() => _LanguageSelectorButtonState();
}

class _LanguageSelectorButtonState extends State<LanguageSelectorButton> {
  late TranslationProvider translationProvider;
  bool value = false;
  
  @override
  void initState() {
    translationProvider = context.read<TranslationProvider>();
    value = translationProvider.locale == const Locale('en');
    super.initState();
  }

  void onChanged(bool value) {
    setState(() {
      this.value = value;
      LanguageSelector item = translationProvider.items[value? 2:1 ];
      translationProvider.setSelected(item);
      translationProvider.setLanguage();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Image.asset(
            'assets/images/br.png',
            scale: 5,
          ),
          const SizedBox(width: 6,),
          SizedBox(
            height: 24,
            child: FittedBox(child: Switch(
                value: value,

                thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.blueAccent;
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white;
                  }
                  return Colors.yellow;
                }),
                trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.red[400];
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white;
                  }
                  return Colors.green[200];
                }),
                onChanged: onChanged)),
          ),
          const SizedBox(width: 6,),
          Image.asset(
            'assets/images/us.png',
            scale: 4.5,
          ),
        ],
      ),
    );
  }

  String _createFlag(String country) {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;
    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;
    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }
}
