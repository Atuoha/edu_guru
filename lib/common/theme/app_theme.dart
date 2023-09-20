import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/color.dart';
import 'styles_manager.dart';
import 'values_manager.dart';
import 'font_manager.dart';

// Light Dark Theme
ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.white,
    disabledColor: AppColors.primarySecondaryBackground,
    scaffoldBackgroundColor: AppColors.primarySecondaryBackground,

    // dialog theme
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.primarySecondaryBackground,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
      contentTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),

    // Bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.primarySecondaryBackground,
    ),

    // card theme
    cardTheme: CardTheme(
      color: AppColors.primarySecondaryBackground,
      shadowColor: Colors.grey,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      shape: StadiumBorder(),
      disabledColor: AppColors.primarySecondaryBackground,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        backgroundColor: AppColors.primaryColor,
        disabledBackgroundColor: AppColors.secondaryColor,
        disabledForegroundColor: Colors.white,
        textStyle: getRegularStyle(
          color: Colors.white,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.normal,
        ),
      ),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.primaryFourElementText,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.primaryFourElementText,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.primaryElementBg,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.primaryElementBg,
        ),
      ),
      labelStyle: getRegularStyle(color: Colors.grey),
      hintStyle: getRegularStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      errorStyle: getRegularStyle(color: Colors.red),
      suffixIconColor: AppColors.primaryColor,
      suffixStyle: getRegularStyle(color: Colors.grey),
      prefixIconColor: AppColors.primaryColor,
      prefixStyle: getRegularStyle(color: Colors.grey),
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: AppSize.s40,
      ),
      color: Colors.transparent,
      elevation: AppSize.s0,
      titleTextStyle: getRegularStyle(
        color: Colors.black,
        // fontSize: FontSize.s16,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
      bodySmall: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s12,
      ),
      bodyLarge: getRegularStyle(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Colors.grey,
        )
        .copyWith(background: AppColors.primarySecondaryBackground),
  );
}
