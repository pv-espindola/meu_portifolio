import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/home/domain/repositories/storage_factory.dart';
import 'package:provider/provider.dart';

import '../../../../language/presentation/provider/translation_provider.dart';

class DownloadCurriculumButton extends StatefulWidget {
  const DownloadCurriculumButton({super.key});

  @override
  State<DownloadCurriculumButton> createState() => _DownloadCurriculumButtonState();
}

class _DownloadCurriculumButtonState extends State<DownloadCurriculumButton> {
  late TranslationProvider translationProvider;

  bool isLoading = false;
  Widget iconDownload = const Icon(
    Icons.download_outlined,
    semanticLabel: 'Download Curriculum',
    size: 28,
  );

  Widget iconLoading = const SizedBox(
      width: 28,
      height: 28,
      child: Padding(
          padding: EdgeInsets.all(6),
          child: CircularProgressIndicator(color: Color(0xff1d256c),)));

@override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
  translationProvider = context.watch<TranslationProvider>();
  String locale = translationProvider.locale.toString();
  CurriculumType curriculumType = locale == 'pt'? CurriculumType.ptBr : CurriculumType.en;


    Widget childButton = isLoading? iconLoading : iconDownload;
    return Material(
      color: const Color(0xff1d256c),
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50),

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: InkWell(
            splashColor: Colors.black.withOpacity(0.8),
            onTap: () {
              launchCurriculum(curriculumType);
              setState(() {
                isLoading= true;
              });
              Future.delayed(const Duration(seconds: 2), (){
                setState(() {
                  isLoading = false;
                });
              });
            },
            child: Column(
              children: [
                const Text(
                  "Download\nCurriculum",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: childButton,
                ),
              ],
            )),
      ),
    );
  }

  launchCurriculum(CurriculumType type){
    StorageFactory.instance.launchCurriculum(type);
  }
}
