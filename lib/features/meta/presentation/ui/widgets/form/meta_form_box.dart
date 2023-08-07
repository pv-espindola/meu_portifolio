import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meu_portifolio/features/meta/data/models/meta_state.dart';
import 'package:meu_portifolio/features/meta/presentation/providers/meta_provider.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/widgets/form/thanks_message.dart';
import 'package:provider/provider.dart';

import '../../../../data/enums.dart';
import 'selector_post_type.dart';
import 'textfield_form_meta.dart';

class MetaFormBox extends StatelessWidget {
  const MetaFormBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = context.watch<MetaProvider>();
    bool isFormEmpty = formProvider.state.formStatus == FormStatus.empty;
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.purpleAccent,
            gradient: const LinearGradient(
              colors: [Colors.black, Colors.orange, Colors.yellow],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 2500),
          switchInCurve: Curves.easeOut,
          layoutBuilder: (widget, widgets) {
            return widget!;
          },
          child: isFormEmpty ? const FormBuilderMeta() : const ThanksMessage(),
        ));
  }
}

class FormBuilderMeta extends StatelessWidget {
  const FormBuilderMeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<MetaProvider>();
    final headTitle = AppLocalizations.of(context)!.formHeadTitle;
    final headText = AppLocalizations.of(context)!.formHeadText;
    final name = AppLocalizations.of(context)!.name;
    final role = AppLocalizations.of(context)!.role;
    final email = AppLocalizations.of(context)!.email;
    final message = AppLocalizations.of(context)!.message;
    final nameHint = AppLocalizations.of(context)!.nameHint;
    final roleHint = AppLocalizations.of(context)!.roleHint;
    final emailHint = AppLocalizations.of(context)!.emailHint;
    final messageHint = getMessageHint(context);


    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 12, left: 24, right: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.65)),
            child: RichText(
              text: TextSpan(
                  text: '$headTitle \n',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text:
                          headText,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ]),
              textAlign: TextAlign.center,
            )),
        Container(
          width: double.maxFinite,
          height: 470,
          margin: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(.65)),
          child: Form(
            key: formProvider.formKey,
            child: Column(
              children: [
                const Flexible(flex: 2, child: SelectorPostType()),
                Flexible(
                  flex: 3,
                  child: TextFieldFormMeta(
                    label: name,
                    hint: nameHint,
                    validator: formProvider.nameValidate,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 8,
                        child: TextFieldFormMeta(
                          label: role,
                          hint: roleHint,
                          validator: formProvider.roleValidate,
                        )),
                    Flexible(
                        flex: 7,
                        child: TextFieldFormMeta(
                          label: email,
                          hint: emailHint,
                          validator: formProvider.emailValidate,
                        ))
                  ],
                ),
                Flexible(
                  flex: 4,
                  child: TextFieldFormMeta(
                    label: message,
                    hint: messageHint,
                    isMessage: true,
                    validator: formProvider.messageValidate,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      formProvider.validate();

                      //SUBMIT WITHOUT SEND ANY DATA TO SERVER
                      //formProvider.updateState(formStatus: FormStatus.completed);
                    },
                    icon: const Icon(Icons.cloud_upload),
                    label: const Text('submit'))
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getMessageHint(BuildContext context){
    final formProvider = context.watch<MetaProvider>();

    switch(formProvider.postType){

      case PostType.note:
        return AppLocalizations.of(context)!.messageNoteHint;
      case PostType.question:
        return AppLocalizations.of(context)!.messageQuestionHint;
      case PostType.challenge:
        return AppLocalizations.of(context)!.messageChallengeHint;
    }

  }
}
