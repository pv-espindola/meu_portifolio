import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/pages/home_meta_section.dart';

import '../../../../../config/app_config.dart';
import '../../../../language/presentation/ui/widgets/language_selector_button.dart';

class MetaSectionPage extends StatelessWidget {
  const MetaSectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.of(context).appTitle),
        centerTitle: true,
        actions: const [LanguageSelectorButton()],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/fancy-background.jpg',
              ),
                fit: BoxFit.cover,
              opacity: 0.5
            ),
          ),
          child:const SingleChildScrollView(child:  MetaSectionBuilder())),
    );
  }
}
