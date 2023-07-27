import 'package:flutter/material.dart';
import 'package:meu_portifolio/curriculo_portifolio.dart';
import 'package:meu_portifolio/features/curriculo/presentation/providers/app_provider.dart';
import 'package:meu_portifolio/features/curriculo/presentation/ui/pages/home_portifolio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app_provider_scope.dart';
import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'config/enums.dart';

void main() async{


  const myApp = AppProviderScope(child: CurriculoPortifolio());

  print('');
  final configuredApp = AppConfig(
      appTitle: 'Meu CurriculoPortifolio',
      flavor: AppFlavor.desktop,
      themeData: AppTheme.theme,
      prefs: await SharedPreferences.getInstance(),
      packageInfo: await PackageInfo.fromPlatform(),
      child: myApp,
  );

  return runApp(configuredApp);
}
