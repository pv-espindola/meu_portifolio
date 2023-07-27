import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/curriculo/presentation/ui/widgets/curriculo_home/contact_home.dart';
import 'package:meu_portifolio/features/curriculo/presentation/ui/widgets/curriculo_home/education_home.dart';
import 'package:meu_portifolio/features/curriculo/presentation/ui/widgets/curriculo_home/title_home.dart';
import 'package:provider/provider.dart';

import '../../../../language/presentation/ui/widgets/language_selector_button.dart';
import '../../../../language/provider/translation_provider.dart';
import '../widgets/curriculo_home/general_attributions_home.dart';
import '../widgets/curriculo_home/introduction_home.dart';
import '../widgets/curriculo_home/projects_home.dart';
import '../widgets/curriculo_home/skills_home.dart';
import '../widgets/curriculo_home/summary_home.dart';
import 'home_meta_section.dart';

class HomePortifolio extends StatefulWidget {
  const HomePortifolio({Key? key}) : super(key: key);

  @override
  State<HomePortifolio> createState() => _HomePortifolioState();
}

class _HomePortifolioState extends State<HomePortifolio> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String locale = Localizations.localeOf(context).languageCode;

      context
          .read<TranslationProvider>()
          .getLanguagePhone(locale);
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constrains) {
      print('H ${constrains.maxHeight} W ${constrains.maxWidth}');
      return Scaffold(
        appBar: AppBar(
          title: Text(AppConfig.of(context).appTitle),
          centerTitle: true,
          actions: [
            const LanguageSelectorButton()
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TitleHome(),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(flex: 3, child: CurriculoSector()),
                      if (constrains.maxWidth > 550)
                        const Expanded(
                          flex: 2,
                          child: HomeMetaSection()
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CurriculoSector extends StatelessWidget {
  const CurriculoSector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool inLine = width < 1020;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 850,
        minWidth: 500,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[400],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IntroductionHome(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ContactHome(),
                      const SummaryHome(),
                      if (inLine)
                        Container(
                          color: Colors.grey[400],
                          child: const ProjectsHome(),
                        )
                    ],
                  ),
                ),
              ),
              if (!inLine)
                const SizedBox(
                  width: 24,
                ),
              if (!inLine) const Flexible(flex: 3, child: ProjectsHome())
            ],
          ),
          const EducationHome(),
          const SizedBox(
            height: 16,
          ),
          const SkillsHome(),
          const SizedBox(
            height: 16,
          ),
          const GeneralAttributionsHome()
        ],
      ),
    );
  }
}
