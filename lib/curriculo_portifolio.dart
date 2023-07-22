import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/curriculo/presentation/providers/app_provider.dart';
import 'package:meu_portifolio/features/curriculo/presentation/ui/pages/home_portifolio.dart';
import 'package:provider/provider.dart';

import 'config/app_config.dart';

class CurriculoPortifolio extends StatefulWidget {
  const CurriculoPortifolio({Key? key}) : super(key: key);

  @override
  State<CurriculoPortifolio> createState() => _CurriculoPortifolioState();
}

class _CurriculoPortifolioState extends State<CurriculoPortifolio> {
  late AppProvider appProvider;

  @override
  void initState() {
    super.initState();
    appProvider = context.read<AppProvider>();


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

      routes: {

      },
      theme: AppConfig.of(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const HomePortifolio(),

    );
  }
}
