
import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';

class TextFieldFormMeta extends StatelessWidget {
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final bool? isMessage;

  const TextFieldFormMeta({
    required this.label,
    this.hint,
    this.validator,
    this.isMessage = false,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMessage!  ? 350 : null,
      margin: const EdgeInsets.all(8),

      child: TextFormField(
        decoration: InputDecoration(
            hintMaxLines: isMessage! ? 10: 1,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(width: 12, color: Colors.blue),

            ),
            label: Text(label.capitalize()),
            hintText: hint,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            alignLabelWithHint: isMessage ?? true !,

            // suffixIcon: isValid
            //     ? const Icon(Icons.check, color: Colors.green)
            //     : const Icon(Icons.error, color: Colors.red),

            floatingLabelBehavior: FloatingLabelBehavior.auto),
          maxLines: isMessage ?? false ? 10 : 1,
        textInputAction: TextInputAction.next,

        validator: validator,
      ),
    );
  }
}