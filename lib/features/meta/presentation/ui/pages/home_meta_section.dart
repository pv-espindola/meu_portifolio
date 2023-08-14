import 'package:flutter/material.dart';

import '../widgets/form/meta_form_box.dart';
import '../widgets/layout_size_control.dart';
import '../widgets/open_letter.dart';
import '../widgets/post_box.dart';

class HomeMetaSection extends StatelessWidget {
  const HomeMetaSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      // constraints: const BoxConstraints(
      //   minHeight: 1560,
      //   maxHeight: 1560,
      //   maxWidth: 550,
      //
      // ),
      alignment: Alignment.topCenter,

      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/fancy-background.jpg',
          ),
          matchTextDirection: true,
          fit: BoxFit.fitHeight,
          repeat: ImageRepeat.noRepeat,
          opacity: .6,
        ),
      ),
      child: const MetaSectionBuilder(),
    );
  }
}

class MetaSectionBuilder extends StatelessWidget {
  const MetaSectionBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: LayoutSizeControl()),
        OpenLetter(),
        PostBox(),
        MetaFormBox()
      ],
    );
  }
}



