import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283980178),
      surfaceTint: Color(4283980178),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292993023),
      onPrimaryContainer: Color(4279440458),
      secondary: Color(4284308594),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293058809),
      onSecondaryContainer: Color(4279900716),
      tertiary: Color(4283980178),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292993023),
      onTertiaryContainer: Color(4279440458),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294768895),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282861135),
      outline: Color(4286019200),
      outlineVariant: Color(4291347920),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290888191),
      primaryFixed: Color(4292993023),
      onPrimaryFixed: Color(4279440458),
      primaryFixedDim: Color(4290888191),
      onPrimaryFixedVariant: Color(4282401144),
      secondaryFixed: Color(4293058809),
      onSecondaryFixed: Color(4279900716),
      secondaryFixedDim: Color(4291216605),
      onSecondaryFixedVariant: Color(4282729817),
      tertiaryFixed: Color(4292993023),
      onTertiaryFixed: Color(4279440458),
      tertiaryFixedDim: Color(4290888191),
      onTertiaryFixedVariant: Color(4282401144),
      surfaceDim: Color(4292663776),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4293979380),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282137972),
      surfaceTint: Color(4283980178),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285427626),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282466645),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285756296),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282137972),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285427626),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768895),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282597963),
      outline: Color(4284440167),
      outlineVariant: Color(4286282115),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290888191),
      primaryFixed: Color(4285427626),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283782799),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285756296),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284111471),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285427626),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283782799),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663776),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4293979380),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279901009),
      surfaceTint: Color(4283980178),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282137972),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280295731),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282466645),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279901009),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282137972),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768895),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280492843),
      outline: Color(4282597963),
      outlineVariant: Color(4282597963),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4293716735),
      primaryFixed: Color(4282137972),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280624732),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282466645),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281019198),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282137972),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280624732),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663776),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4293979380),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290888191),
      surfaceTint: Color(4290888191),
      onPrimary: Color(4280887904),
      primaryContainer: Color(4282401144),
      onPrimaryContainer: Color(4292993023),
      secondary: Color(4291216605),
      onSecondary: Color(4281216834),
      secondaryContainer: Color(4282729817),
      onSecondaryContainer: Color(4293058809),
      tertiary: Color(4290888191),
      onTertiary: Color(4280887904),
      tertiaryContainer: Color(4282401144),
      onTertiaryContainer: Color(4292993023),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279440152),
      onSurface: Color(4293190121),
      onSurfaceVariant: Color(4291347920),
      outline: Color(4287729562),
      outlineVariant: Color(4282861135),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4283980178),
      primaryFixed: Color(4292993023),
      onPrimaryFixed: Color(4279440458),
      primaryFixedDim: Color(4290888191),
      onPrimaryFixedVariant: Color(4282401144),
      secondaryFixed: Color(4293058809),
      onSecondaryFixed: Color(4279900716),
      secondaryFixedDim: Color(4291216605),
      onSecondaryFixedVariant: Color(4282729817),
      tertiaryFixed: Color(4292993023),
      onTertiaryFixed: Color(4279440458),
      tertiaryFixedDim: Color(4290888191),
      onTertiaryFixedVariant: Color(4282401144),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940031),
      surfaceContainerLowest: Color(4279111187),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280953135),
      surfaceContainerHighest: Color(4281676858),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291217151),
      surfaceTint: Color(4290888191),
      onPrimary: Color(4279045445),
      primaryContainer: Color(4287269832),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291479777),
      onSecondary: Color(4279506214),
      secondaryContainer: Color(4287664037),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291217151),
      onTertiary: Color(4279045445),
      tertiaryContainer: Color(4287269832),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440152),
      onSurface: Color(4294834687),
      onSurfaceVariant: Color(4291611092),
      outline: Color(4288979372),
      outlineVariant: Color(4286808716),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4282466938),
      primaryFixed: Color(4292993023),
      onPrimaryFixed: Color(4278715969),
      primaryFixedDim: Color(4290888191),
      onPrimaryFixedVariant: Color(4281282662),
      secondaryFixed: Color(4293058809),
      onSecondaryFixed: Color(4279176993),
      secondaryFixedDim: Color(4291216605),
      onSecondaryFixedVariant: Color(4281611336),
      tertiaryFixed: Color(4292993023),
      onTertiaryFixed: Color(4278715969),
      tertiaryFixedDim: Color(4290888191),
      onTertiaryFixedVariant: Color(4281282662),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940031),
      surfaceContainerLowest: Color(4279111187),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280953135),
      surfaceContainerHighest: Color(4281676858),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294834687),
      surfaceTint: Color(4290888191),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291217151),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294834687),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291479777),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294834687),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291217151),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440152),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294834687),
      outline: Color(4291611092),
      outlineVariant: Color(4291611092),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4280492889),
      primaryFixed: Color(4293321983),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291217151),
      onPrimaryFixedVariant: Color(4279045445),
      secondaryFixed: Color(4293321982),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291479777),
      onSecondaryFixedVariant: Color(4279506214),
      tertiaryFixed: Color(4293321983),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291217151),
      onTertiaryFixedVariant: Color(4279045445),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940031),
      surfaceContainerLowest: Color(4279111187),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280953135),
      surfaceContainerHighest: Color(4281676858),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surfaceContainer,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
