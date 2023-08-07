
import 'package:flutter/material.dart';

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