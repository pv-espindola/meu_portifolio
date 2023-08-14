import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/translation_provider.dart';

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
      width: 130,

      margin: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Image.asset(
            'assets/images/br.png',
            scale: value? 7 : 5 ,
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
            scale: value? 4.5 : 6.5,
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

class FlagLanguage extends StatelessWidget {
  final bool value;
  const FlagLanguage({
    required this.value,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> flags = ['assets/images/br.png', 'assets/images/us.png' ];

    return AnimatedSwitcher(duration: const Duration(seconds: 1),
    child: Image.asset(
      flags[value?1 : 0],
      scale: value? 4.5 : 6.5,
    ),
    );
  }
}




