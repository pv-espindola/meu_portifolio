import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/curriculo/presentation/providers/app_provider.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/pages/meta_section_page.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  final String meta = 'assets/images/metalanguage.jpg';
  final String curriculum = 'assets/images/curriculum.jpg';

  final Color metaColor = const Color(0xffe4dfd8);
  final Color curriculoColor = const Color(0xffbdaa9c);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = context.read<AppProvider>();
    int index = appProvider.pageController.page!.toInt();
    bool isFirstPage = index == 0;


    return Drawer(
      elevation: 8,
      backgroundColor: isFirstPage? metaColor :curriculoColor,
      child: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     alignment: Alignment.topCenter,
        //       image: AssetImage('assets/images/metalanguage.jpg'))
        // ),
        child: Column(
          children: [
            Image.asset(
              isFirstPage?
                  meta
              : curriculum,
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
              child: Text(
                '${isFirstPage? 'Meta-language' : 'Curriculum'}\n Area',
                textAlign: TextAlign.center,
              ),
              onPressed: ()  {
                index == 0?
                appProvider.moveToMeta()
                    : appProvider.moveToCurriculo();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
