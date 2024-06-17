import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281688462),
      surfaceTint: Color(4281688462),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291945727),
      onPrimaryContainer: Color(4278197558),
      secondary: Color(4283654000),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292273399),
      onSecondaryContainer: Color(4279180331),
      tertiary: Color(4287580748),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957785),
      onTertiaryContainer: Color(4282058766),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294507007),
      background: Color(4294507007),
      onBackground: Color(4281217333),
      onSurface: Color(4279835680),
      onSurfaceVariant: Color(4282533710),
      outline: Color(4285757311),
      outlineVariant: Color(4291020751),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217333),
      inversePrimary: Color(4288727805),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279387504),
      surfaceTint: Color(4281688462),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283266982),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281812051),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285101703),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285411122),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289355617),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294507007),
      onBackground: Color(4281217333),
      surface: Color(4294507007),
      onSurface: Color(4279835680),
      onSurfaceVariant: Color(4282336074),
      outline: Color(4284178279),
      outlineVariant: Color(4285954947),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217333),
      inversePrimary: Color(4288727805),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199360),
      surfaceTint: Color(4281688462),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4279387504),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279640882),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281812051),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282650388),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285411122),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294507007),
      onBackground: Color(4281217333),
      surface: Color(4294507007),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280296491),
      outline: Color(4282336074),
      outlineVariant: Color(4282336074),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217333),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288727805),
      surfaceTint: Color(4288727805),
      onPrimary: Color(4278202968),
      primaryContainer: Color(4279781748),
      onPrimaryContainer: Color(4291945727),
      secondary: Color(4290431195),
      onSecondary: Color(4280627520),
      secondaryContainer: Color(4282075224),
      onSecondaryContainer: Color(4292273399),
      tertiary: Color(4294947764),
      onTertiary: Color(4283833633),
      tertiaryContainer: Color(4285739830),
      onTertiaryContainer: Color(4294957785),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(0x00018c2a),
      onBackground: Color(4293453793),
      surface: Color(4279243800),
      onSurface: Color(4292993768),
      onSurfaceVariant: Color(4291020751),
      outline: Color(4287467929),
      outlineVariant: Color(4282533710),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292993768),
      inversePrimary: Color(4281688462),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289122047),
      surfaceTint: Color(4288727805),
      onPrimary: Color(4278196013),
      primaryContainer: Color(4285174980),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290759903),
      onSecondary: Color(4278851365),
      secondaryContainer: Color(4286943908),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949305),
      onTertiary: Color(4281598729),
      tertiaryContainer: Color(4291525244),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(0x00018c2a),
      onBackground: Color(4293453793),
      surface: Color(4279243800),
      onSurface: Color(4294638335),
      onSurfaceVariant: Color(4291283923),
      outline: Color(4288652203),
      outlineVariant: Color(4286546827),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292993768),
      inversePrimary: Color(4279913078),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294638335),
      surfaceTint: Color(4288727805),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289122047),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294638335),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290759903),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294949305),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(0x00018c2a),
      onBackground: Color(4293453793),
      surface: Color(4279243800),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294638335),
      outline: Color(4291283923),
      outlineVariant: Color(4291283923),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292993768),
      inversePrimary: Color(4278201421),
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
        scaffoldBackgroundColor: colorScheme.background,
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
