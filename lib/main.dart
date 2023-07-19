import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/curriculo/presentation/ui/pages/home_portifolio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'config/enums.dart';

void main() async{


  final configuredApp = AppConfig(
      appTitle: 'Meu CurriculoPortifolio',
      flavor: AppFlavor.desktop,
      themeData: AppTheme.theme,
      prefs: await SharedPreferences.getInstance(),
      packageInfo: await PackageInfo.fromPlatform(),
  child: const HomePortifolio(),
  );

  return runApp(configuredApp);
}
