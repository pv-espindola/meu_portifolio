import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/widgets/meta_expansion_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OpenLetter extends StatelessWidget {
  const OpenLetter({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    final String title = AppLocalizations.of(context)!.openLetterTitle;
    final String value = AppLocalizations.of(context)!.openLetterValue;
    return MetaExpansionBox(
        title: title,
        value: value);
  }


}