import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/config/app_theme.dart';
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
    bool value = appProvider.layoutButtonValue;



    return Visibility(
      visible: MediaQuery.of(context).size.width > 740,
      child: Container(
        width: 210,
        height: 40,

        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(.56),
        ),
        alignment: Alignment.centerLeft,
        child: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(fold.capitalize(),
                style: value? Theme.of(context).textTheme!.layoutSizeControlStyleOn
                    : Theme.of(context).textTheme!.layoutSizeControlStyleOff,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Switch(value: appProvider.layoutButtonValue,
                    onChanged: appProvider.layoutChange),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(expand.capitalize(),
                  style: value? Theme.of(context).textTheme!.layoutSizeControlStyleOff
                      :  Theme.of(context).textTheme!.layoutSizeControlStyleOn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
