import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../curriculo/presentation/providers/app_provider.dart';

class LayoutSizeControl extends StatelessWidget {
  const LayoutSizeControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
final String fold = AppLocalizations.of(context)!.fold;
final String expand = AppLocalizations.of(context)!.expand;

    return FittedBox(
      child: Container(

        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(.56),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(fold.capitalize()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Switch(value: appProvider.layoutValue,
                  onChanged: appProvider.layoutChange),
            ),
            Text(expand.capitalize()),
          ],
        ),
      ),
    );
  }
}
