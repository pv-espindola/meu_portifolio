import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meu_portifolio/curriculo_portifolio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app_provider_scope.dart';
import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'config/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const myApp = AppProviderScope(child: CurriculoPortifolio());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAI8SsIX_Vg2x3_aqAtVQDqHec-oDh801s",
        authDomain: "curriculo-protifolio.firebaseapp.com",
        projectId: "curriculo-protifolio",
        storageBucket: "curriculo-protifolio.appspot.com",
        messagingSenderId: "183703684757",
        appId: "1:183703684757:web:6b05fd1bf08955f83c7d9c",
        measurementId: "G-VH5JJC9Z92"
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
