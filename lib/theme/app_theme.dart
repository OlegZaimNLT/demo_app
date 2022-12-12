import 'package:demo_app/theme/theme.dart';
import 'package:flutter/material.dart';

/// Official theme, containing text theme
/// and individual components theme
class AppTheme {
  /// Text theme for light mode, currently the only mode.
  /// Dark text on light surface
  static TextTheme get lightTextTheme {
    return TextTheme(
      headline1: AppTextStyle.headline2,
      headline2: AppTextStyle.headline3,
      subtitle1: AppTextStyle.subtitle1,
      subtitle2: AppTextStyle.subtitle2,
      bodyText1: AppTextStyle.body,
      button: AppTextStyle.button,
      caption: AppTextStyle.caption,
      overline: AppTextStyle.overline,
    );
  }

  /// Theme on light mode, currently the only mode.
  /// Applies to colors and individual components.
  static ThemeData get light {
    return ThemeData(
      textTheme: lightTextTheme,

      /// Sets the default size of icons to 32
      iconTheme: const IconThemeData(size: 32),

      /// Sets the primary color to shiraz, in
      /// order to match the design
      primarySwatch: AppColors.green,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,

      /// Sets the default app bar background color to white, with dark
      /// text and 0.5 of elevation in order to match the design
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        foregroundColor: AppColors.silver,
        iconTheme: const IconThemeData(size: 32, color: AppColors.silver),
        centerTitle: true,
        elevation: 0,
        actionsIconTheme: IconThemeData(
          size: 32,
          color: AppColors.grey.shade300,
        ),
        titleTextStyle:
            AppTextStyle.headline2.copyWith(color: AppColors.silver.shade900),
        toolbarTextStyle: lightTextTheme.headline2,
      ),

      /// Sets the default shape, colors, elevation and padding
      /// to match the design, making use of the primary color flushOrange
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.green.shade700;
              }

              return AppColors.green.shade700;
            },
          ),
          shape: MaterialStateProperty.resolveWith((states) {
            return RoundedRectangleBorder();
          }),
          foregroundColor: MaterialStateProperty.all(AppColors.white),
          overlayColor: MaterialStateProperty.all(AppColors.green.shade700),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 23, horizontal: 18),
          ),
        ),
      ),

      /// Sets the default shape and colors to match the design,
      /// using the primary color shiraz for text and its variation
      /// shiraz 100 when it is pressed
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          ),
        ),
      ),

      errorColor: AppColors.danger,

      /// Sets the default style of text fields to match
      /// the design. Mainly removes borders and applies a
      /// circular border radius to corners.
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.grey.shade50,
        filled: true,
        floatingLabelStyle: AppTextStyle.headline3.copyWith(
          color: AppColors.silver.shade300,
        ),
        labelStyle: AppTextStyle.subtitle2.copyWith(
          color: AppColors.silver.shade300,
        ),
        errorStyle: AppTextStyle.overline.copyWith(
          color: AppColors.danger,
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        hintStyle: AppTextStyle.subtitle1.copyWith(
          color: AppColors.silver.shade300,
        ),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
      ),
    );
  }

  static ButtonStyle get outlinedPrimaryButton {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.green),
      foregroundColor: MaterialStateProperty.all(AppColors.white),
      overlayColor: MaterialStateProperty.all(AppColors.green),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
    );
  }

  static ButtonStyle get outlinedSecondaryButton {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.white),
      foregroundColor: MaterialStateProperty.all(AppColors.green.shade700),
      overlayColor: MaterialStateProperty.all(AppColors.green.shade200),
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return const RoundedRectangleBorder();
        }
        return RoundedRectangleBorder(
          side: BorderSide(color: AppColors.green.shade700),
        );
      }),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
    );
  }
}
