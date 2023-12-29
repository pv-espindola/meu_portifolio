import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/home/presentation/ui/widgets/title_home.dart';
import 'package:provider/provider.dart';
import '../../../../curriculo/presentation/providers/app_provider.dart';
import '../../../../language/presentation/provider/translation_provider.dart';
import '../../../../language/presentation/ui/widgets/language_selector_button.dart';
import '../widgets/home_drawer.dart';
import '../widgets/home_phone_view.dart';
import '../widgets/home_web_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePortifolio extends StatefulWidget {
  const HomePortifolio({Key? key}) : super(key: key);

  @override
  State<HomePortifolio> createState() => _HomePortifolioState();
}

class _HomePortifolioState extends State<HomePortifolio> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String locale = Localizations.localeOf(context).languageCode;
      context.read<TranslationProvider>().getLanguagePhone(locale);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constrains) {
      bool isWebView = constrains.maxWidth > 550;
      print('H ${constrains.maxHeight} W ${constrains.maxWidth}');
      return Scaffold(
        appBar: AppBar(
          title: FittedBox(child: Text(AppConfig.of(context).appTitle)),
          centerTitle: true,
          actions: const [LanguageSelectorButton()],
        ),
        drawer: isWebView ? null : const HomeDrawer(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            child: isWebView
                ? SingleChildScrollView(
                    controller: scrollController,
                    child: const Column(
                      children: [
                        TitleHome(),
                        HomeWebView(),
                      ],
                    ),
                  )
                : const HomePhoneView()
          ),
        ),
      );
    });
  }
}
