import 'package:flutter/rendering.dart';

import 'app_colors.dart';

/// Official text styles.
abstract class AppTextStyle {
  static TextStyle get headline1 {
    return _headerTextStyle.copyWith(
      fontSize: 18,
      letterSpacing: 0.38,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get headline2 {
    return _headerTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.medium,
      letterSpacing: 0.12,
    );
  }

  static TextStyle get subtitle1 {
    return _bodyTextStyle.copyWith(
      fontWeight: AppFontWeight.medium,
      fontSize: 18,
      letterSpacing: 0.4,
    );
  }

  static TextStyle get subtitle2 {
    return _bodyTextStyle.copyWith(
      fontWeight: AppFontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.15,
    );
  }

  static TextStyle get body {
    return _bodyTextStyle.copyWith(
      letterSpacing: 0.08,
    );
  }

  static TextStyle get button {
    return _bodyTextStyle.copyWith(
      fontWeight: AppFontWeight.bold,
      fontSize: 14,
      letterSpacing: 0.32,
    );
  }

  static TextStyle get textButtonUnderlined {
    return _bodyTextStyle.copyWith(
      fontWeight: AppFontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.33,
      color: AppColors.pinkAccent,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle get caption {
    return _bodyTextStyle.copyWith(
      fontSize: 16,
      letterSpacing: 0.33,
    );
  }

  static TextStyle get overline {
    return _bodyTextStyle.copyWith(
      fontWeight: AppFontWeight.bold,
      fontSize: 12,
      letterSpacing: 0.18,
    );
  }

  /// Base style for all body text and variants.
  static final _bodyTextStyle = TextStyle(
    color: AppColors.silver.shade300,
    fontSize: 16,
    fontWeight: AppFontWeight.medium,
  );

  /// Base style for all heading text and variants.
  static final _headerTextStyle = TextStyle(
    color: AppColors.silver.shade900,
    fontSize: 18,
    fontWeight: AppFontWeight.bold,
  );
}

/// Weights for text styles.
abstract class AppFontWeight {
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w900;
}
