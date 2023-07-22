import 'package:flutter/material.dart';

import '../widgets/meta_section/on_building_banner.dart';

class HomeMetaSection extends StatelessWidget {
  const HomeMetaSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height * 2,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/meta-language-background.jpg',
          ),
          matchTextDirection: true,
          fit: BoxFit.contain,
          repeat: ImageRepeat.repeat,
          opacity: .6,
        ),
      ),
      child: const Column(
        children: [
          OnBuildingBanner()
        ],
      ),
    );
  }
}
