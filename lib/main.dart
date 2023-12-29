import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meu_portifolio/curriculo_portifolio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app_provider_scope.dart';
import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'config/enums.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  const myApp = AppProviderScope(
      child: CurriculoPortifolio());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAI8SsIX_Vg2x3_aqAtVQDqHec-oDh801s",
      appId: "1:183703684757:web:1f211c731b4bcf983c7d9c",
      messagingSenderId: "183703684757",
      projectId: "curriculo-protifolio",
    ),
  );


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
