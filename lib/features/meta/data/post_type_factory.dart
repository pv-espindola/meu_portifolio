import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/providers/meta_provider.dart';
import 'enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class PostTypeFactory{





  static String getPostName(BuildContext context, PostType type){
    switch(type){

      case PostType.note:
        return AppLocalizations.of(context)!.note;
      case PostType.question:
        return AppLocalizations.of(context)!.question;
      case PostType.challenge:
        return AppLocalizations.of(context)!.challenge;
    }

  }

  static getPostIcon(PostType type) {
    switch (type) {
      case PostType.note:
        return const Icon(
          Icons.speaker_notes,
          color: Colors.black,
        );
      case PostType.question:
        return const Icon(
          Icons.question_answer,
          color: Colors.black,
        );
      case PostType.challenge:
        return const Icon(
          Icons.local_fire_department,
          color: Colors.black,
        );
    }
  }

  static Color getPostColor(PostType type){
    switch(type){
      case PostType.note: return Colors.indigo;
      case PostType.question: return const Color(0x003dbd33);
      case PostType.challenge: return const Color(0x00dc318d);
    }
  }

}