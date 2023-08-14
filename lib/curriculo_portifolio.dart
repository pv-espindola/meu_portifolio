import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meu_portifolio/features/curriculo/presentation/providers/app_provider.dart';
import 'package:meu_portifolio/features/home/presentation/ui/pages/home_portifolio.dart';
import 'package:meu_portifolio/features/meta/presentation/providers/meta_provider.dart';
import 'package:provider/provider.dart';

import 'config/app_config.dart';
import 'features/language/presentation/provider/translation_provider.dart';

class CurriculoPortifolio extends StatefulWidget {
  const CurriculoPortifolio({Key? key}) : super(key: key);

  @override
  State<CurriculoPortifolio> createState() => _CurriculoPortifolioState();
}

class _CurriculoPortifolioState extends State<CurriculoPortifolio> {
  late AppProvider appProvider;
  late MetaProvider metaFormProvider;

  @override
  void initState() {
    super.initState();
    appProvider = context.read<AppProvider>();
    metaFormProvider = context.read<MetaProvider>()
    ..loadMetaState();


  }
  @override
  void didChangeDependencies() {
    double width = MediaQuery.of(context).size.width;
    appProvider.loadScreenWidth(width);
    print('Tela => $width');
    super.didChangeDependencies();
  }







  @override
  Widget build(BuildContext context) {




    return MaterialApp(

      routes: const {

      },
      theme: AppConfig.of(context).themeData,
      debugShowCheckedModeBanner: false,
      locale: context.watch<TranslationProvider>().locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],


      supportedLocales: L10n.support,
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      home: const HomePortifolio(),

    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}
