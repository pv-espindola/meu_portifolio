import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/curriculo/presentation/providers/app_provider.dart';
import 'package:provider/provider.dart';

class AppBootstrap extends StatelessWidget {
  final Widget child;
  const AppBootstrap({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          ChangeNotifierProvider(
            create: (context) => AppProvider(),
          ),
        ],
        child: child);
  }
}
