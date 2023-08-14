import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/widgets/meta_expansion_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../config/theme_extensions/gradient_extension.dart';

class OpenLetter extends StatelessWidget {
  const OpenLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = AppLocalizations.of(context)!.openLetterTitle;
    final String value = AppLocalizations.of(context)!.openLetterValue;
    return MetaExpansionBox(
      title: title,
      gradient: Theme.of(context)
          .extension<GradientExtension>()!
          .openLetterGradient,
      child: Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            value!,
            style: Theme.of(context).textTheme.metaBoxTitle,
          )),
    );
  }
}
