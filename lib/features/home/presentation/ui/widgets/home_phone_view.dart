import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/curriculo/presentation/providers/app_provider.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/pages/home_meta_section.dart';
import 'package:provider/provider.dart';

import '../../../../curriculo/presentation/ui/pages/home_curriculo_section.dart';
import '../../../../curriculo/presentation/ui/widgets/curriculo_home/title_home.dart';

class HomePhoneView extends StatelessWidget {
  const HomePhoneView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = context.watch<AppProvider>();
    final pages = appProvider.pages;
    return PageView.builder(
      controller: appProvider.pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                    visible: index == 0,
                    child: const TitleHome()),
                pages.elementAt(index)
                //Expanded(child: pages.elementAt(index)),
              ],
            ),
          );
        });
  }
}
