import "dart:ui";

import "package:flutter/material.dart";

@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  final double buttonSpacing;
  final double appMarginSpacing;
  final double large;

  const AppSpacing({
    this.buttonSpacing = 7,
    this.appMarginSpacing = 14,
    this.large = 21
  });

  @override
  AppSpacing copyWith({double? small, double? medium, double? large}) {
    return AppSpacing(
      buttonSpacing: small ?? this.buttonSpacing,
      appMarginSpacing: medium ?? this.appMarginSpacing,
      large: large ?? this.large
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if(other is! AppSpacing) return this;
    return AppSpacing(
      buttonSpacing: lerpDouble(buttonSpacing, other.buttonSpacing, t)!,
      appMarginSpacing: lerpDouble(appMarginSpacing, other.appMarginSpacing, t)!,
      large: lerpDouble(large, other.large, t)!
    );
  }
}