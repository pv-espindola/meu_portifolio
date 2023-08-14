import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../curriculo/presentation/providers/app_provider.dart';
import '../../../../curriculo/presentation/ui/pages/home_curriculo_section.dart';
import '../../../../meta/presentation/ui/pages/home_meta_section.dart';

class HomeWebView extends StatelessWidget {
  const HomeWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 740) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: appProvider.curriculoFlex,
                child: const HomeCurriculoSection()),
            Expanded(
                flex: appProvider.metaFlex, child: const HomeMetaSection()),
          ],
        );
      }

      return const Column(
        children: [
          HomeCurriculoSection(),
          HomeMetaSection(),
        ],
      );
    });
  }
}
