import 'package:flutter/material.dart';
import 'package:meu_portifolio/features/meta/presentation/providers/meta_form_provider.dart';
import 'package:provider/provider.dart';

import 'post_type_selector.dart';

class MetaFormBox extends StatelessWidget {
  const MetaFormBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: const FormBuilderMeta());
  }
}

class FormBuilderMeta extends StatelessWidget {
  const FormBuilderMeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<MetaFormProvider>();
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
                  text: 'Ajude o porjeto \n',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text:
                          'forneça seu feedback deixando um comentario, pergunta ou desafio.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ]),
              textAlign: TextAlign.center,
            )),
        Container(
          width: double.maxFinite,
          height: 450,
          margin: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(.65)),
          child: Form(
            key: formProvider.formKey,
            child: Column(
              children: [
                const Flexible(child: PostTypeSelector()),
                const TextFieldFormMeta(
                  label: 'Nome',
                ),
                const Row(
                  children: [
                    Flexible(
                        flex: 8,
                        child: TextFieldFormMeta(
                          label: 'Cargo',
                        )),
                    Flexible(
                        flex: 7,
                        child: TextFieldFormMeta(
                          label: 'Email',
                          hint: 'example@company.com',
                        ))
                  ],
                ),
                const TextFieldFormMeta(
                  label: 'Message',
                  isMessage: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.cloud_upload),
                    label: const Text('submit'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldFormMeta extends StatelessWidget {
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final bool? isMessage;

  const TextFieldFormMeta({
        required this.label,
        this.hint,
        this.validator,
        this.isMessage,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(width: 12, color: Colors.blue),
            ),
            label: Text(label),
            hintText: hint,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            alignLabelWithHint: true,

            // suffixIcon: isValid
            //     ? const Icon(Icons.check, color: Colors.green)
            //     : const Icon(Icons.error, color: Colors.red),

            floatingLabelBehavior: FloatingLabelBehavior.auto),
        maxLines: isMessage ?? false ? 5 : 1,
        validator: validator,
      ),
    );
  }
}
