import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/curriculo/presentation/providers/app_provider.dart';
import 'package:provider/provider.dart';
import '../features/language/presentation/provider/translation_provider.dart';
import '../features/meta/presentation/providers/meta_provider.dart';

class AppProviderScope extends StatelessWidget {
  final Widget child;

  const AppProviderScope({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => AppProvider(),
      ),
      ChangeNotifierProvider<TranslationProvider>(
          create: (_) => TranslationProvider()
      ),
      ChangeNotifierProvider<MetaProvider>(
          create: (_) => MetaProvider.instance
      ),
    ], child: child);
  }
}
