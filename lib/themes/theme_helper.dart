import 'package:ai_virtual_classroom/themes/app_colors.dart';
import 'package:flutter/material.dart';
import '../core/app_exports.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      // useMaterial3: true,
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,

      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray100,
      appBarTheme: AppBarTheme(
        elevation: 1,
        centerTitle: true,
        backgroundColor: AppTheme().white,
        iconTheme: IconThemeData(color: AppTheme().black200),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          shadowColor: colorScheme.primary,
          elevation: 14,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          //color: colorScheme.primaryContainer,
          color: appTheme.blueGray800,
          fontSize: 18.fSize,
          fontFamily: 'ExoRoman',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray800,
          fontSize: 14.fSize,
          fontFamily: 'RobotoRoman',
          fontWeight: FontWeight.w300,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onError,
          fontSize: 20.fSize,
          fontFamily: 'ExoRoman',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 16.fSize,
          fontFamily: 'ExoRoman',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X1900000),
    primaryContainer: Color(0XFF191D88),
    secondary: Color(0XFF191D88),
    secondaryContainer: Color(0XFF636D77),
    tertiary: Color(0XFF191D88),
    tertiaryContainer: Color(0XFF636D77),

    // Background colors
    background: Color(0XFF191D88),

    // Surface colors
    surface: Color(0XFF191D88),
    surfaceTint: Color(0XFF263238),
    surfaceVariant: Color(0XFF636D77),

    // Error colors
    error: Color(0XFF263238),
    errorContainer: Color(0XFF96A7D0),
    onError: Color(0XFFFFFFFF),
    onErrorContainer: Color(0XFF191D88),

    // On colors(text colors)
    onBackground: Color(0XFFFFC436),
    onInverseSurface: Color(0XFFFFFFFF),
    onPrimary: Color(0XFF263238),
    onPrimaryContainer: Color(0XFFFFC436),
    //Icon
    onSecondary: Color.fromARGB(255, 249, 248, 245),
    onSecondaryContainer: Color(0XFF191D88),
    onTertiary: Color(0XFFFFC436),
    onTertiaryContainer: Color(0XFF191D88),

    // Other colors
    outline: Color(0XFF263238),
    outlineVariant: Color(0XFF191D88),
    scrim: Color(0XFF191D88),
    shadow: Color(0XFF263238),

    // Inverse colors
    inversePrimary: Color(0XFF191D88),
    inverseSurface: Color(0XFF263238),

    // Pending colors
    onSurface: Color(0XFFFFC436),
    onSurfaceVariant: Color(0XFF191D88),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // BlueGray
  Color get blueGray400 => const Color(0XFF888888);
  Color get blueGray700 => const Color(0XFF455A64);
  Color get blueGray800 => const Color(0XFF364356);

  // Gray
  Color get gray100 => const Color(0XFFF4F5F9);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
