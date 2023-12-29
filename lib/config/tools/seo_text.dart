import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class SeoText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final int valueRenderStyle;
  const SeoText({
    required this.text,
    required this.textStyle,
    required this.textAlign,
    required this.valueRenderStyle,
    super.key});

  @override
  Widget build(BuildContext context) {

    return TextRenderer(
      style: TextRendererStyle.values[valueRenderStyle],
        child: SelectableText(text,
        textAlign: textAlign,
        style: textStyle,
        ));
  }
}
