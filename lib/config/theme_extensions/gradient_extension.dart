import 'package:flutter/material.dart';

import '../../features/meta/data/enums.dart';

class GradientExtension extends ThemeExtension<GradientExtension> {
  Gradient getPostGradient(PostType type) {
    List<Color> colors = [];

    switch (type) {
      case PostType.note:
        colors = [
          const Color(0xff3a86df),
          const Color(0xff161caa),
          Colors.black,
        ];
      case PostType.question:
        colors = [
          const Color(0xff5cd821),
          const Color(0xff256f03),
          const Color(0xff095211),
          Colors.black,
        ];
      case PostType.challenge:
        colors = [
          const Color(0xffece30d),
          const Color(0xffeca00d),
          const Color(0xffff0909),
          const Color(0xffad1f1f),
          Colors.black,
        ];
    }
    colors = colors.map((e) => e.withOpacity(.9)).toList();

    return LinearGradient(
      colors: colors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  @override
  ThemeExtension<GradientExtension> copyWith() => GradientExtension();

  @override
  ThemeExtension<GradientExtension> lerp(
      covariant ThemeExtension<GradientExtension>? other, double t) {
    if (other is! GradientExtension) {
      return this;
    }
    return GradientExtension();
  }
}
