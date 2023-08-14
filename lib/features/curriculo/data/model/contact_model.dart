import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../config/app_clibboard.dart';
import '../../../../config/app_icons.dart';
import '../../../../config/app_url_launcher.dart';
enum ContactType {git, linkedin, phone, email}
class ContactModel {
  final String text;
  final IconData icon;
  final void Function() action;
  final ContactType type;

  ContactModel(
  {
    required this.text,
    required this.icon,
    required this.action,
    required this.type,
  }
      );

  factory ContactModel.git(){
    return ContactModel(
        text: AppUrlLauncher.instance.myGit,
        icon: AppIcons.github,
        action: AppUrlLauncher.instance.openGit,
        type: ContactType.git);
  }

  factory ContactModel.linkedin(){
    return ContactModel(
        text: AppUrlLauncher.instance.myLinkedin,
        icon: AppIcons.linkedin,
        action: AppUrlLauncher.instance.openLinkedin,
        type: ContactType.linkedin);
  }

  factory ContactModel.phone(){
    return ContactModel(
        text: AppClipboard.instance.myPhone,
        icon: Icons.phone,
        action: AppClipboard.instance.getPhone,
        type: ContactType.phone);
  }

  factory ContactModel.email(){
    return ContactModel(
        text: AppClipboard.instance.myEmail,
        icon: Icons.mail,
        action: AppClipboard.instance.getEmail,
        type: ContactType.email);
  }



}