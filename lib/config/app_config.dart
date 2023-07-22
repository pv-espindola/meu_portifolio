import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums.dart';

class AppConfig extends InheritedWidget {
  final String appTitle;
  final AppFlavor flavor;
  final ThemeData themeData;
  final SharedPreferences prefs;
  final PackageInfo packageInfo;



  const AppConfig({
    Key? key,
    required this.appTitle,
    required this.flavor,
    required this.themeData,
    required this.prefs,
    required this.packageInfo,
    required Widget child
  }) : super(key: key, child: child);



  static AppConfig of(BuildContext context) {
    final AppConfig? result =
    context.dependOnInheritedWidgetOfExactType<AppConfig>();
    assert(result != null, 'No AppConfig found in context');
    return result!;
  }


  @override
  bool updateShouldNotify(AppConfig oldWidget) => false;

  String get version => "${packageInfo.version} (${packageInfo.buildNumber})";


}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}