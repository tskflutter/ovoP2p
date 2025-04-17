import 'package:flutter/material.dart';

class MyColor {
  // ===================== Neutral Colors =====================
  static const Color transparent = Colors.transparent;
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // ===================== Light Theme Colors =====================
  // Primary & Secondary
  static const Color lightPrimary = Color(0xFF007AFF);
  static const Color lightSecondary = Color(0xFF842BE2);
  static const Color lightSecondaryButton = Color(0xFF663DE9);

  // Card Colors
  static const Color lightCardColor = Color(0x13FFFFFF);
  static const Color lightCardColor2 = Color(0xFF222A3B);
  static const Color lightCardStepColor = Color(0xFF3D3C58);
  static const Color lightTwoFaCardColor = Color(0xFF334155);
  // Text Colors
  static const Color lightHeadingText = Color(0xFFE2E8F0);
  static const Color lightBodyText = Color(0xFF94A3B8);
  // static const Color lightBodyText = Color(0xFF9FA6AD);

  // Accent Colors
  static const Color lightAccent1 = Color(0xFF77AAFF);

  // Section & Background
  static const Color lightBackground = Color(0xFF020617); // Light Background
  static const Color lightCardBackground = Color(0xFFFFFFFF); // Card Background
  static const Color lightSectionBackground = Color(0xFFF8FAFC); // Section Background
  static const Color lightScaffoldBackground = Color(0xFFF8FAFC); // Scaffold Background
  static const Color lightAppBarBackground = Color(0xFFF8FAFC); // Dark AppBar background
  // Borders
  static const Color lightBorder = Color(0x1FFFFFFF);

  // Feedback Colors
  static const Color lightInformation = Color(0xFF007AFF);
  static const Color lightWarning = Color(0xFFFFCC00);
  static const Color lightSuccess = Color(0xFF35C75A);
  static const Color lightError = Color(0xFFEB4E3D);

  // Button Colors
  static const Color lightButtonBackground = lightPrimary;
  static const Color lightButtonText = white;

  // ===================== Dark Theme Colors =====================
  // Primary & Secondary
  static const Color darkPrimary = Color(0xFFFF5722); // A slightly muted orange for dark mode
  static const Color darkSecondary = Color(0xFF1E88E5); // A deeper blue for contrast

  // Text Colors
  static const Color darkHeadingText = Color(0xFFFFFFFF); // Almost white for headings
  static const Color darkBodyText = Color(0xFFFFFFFF); // Light gray for body text

  // Accent Colors
  static const Color darkAccent1 = Color(0xFF64B5F6); // Soft blue accent

  static const Color textSenderbgColor = Color(0x6600E1E2); // Soft blue accent

  // Section & Background
  static const Color darkBackground = Color(0xFF121212); // Dark mode background
  static const Color pcBackground = Color(0xFF0F172A); // Profile Complete background
  static const Color darkCardBackground = Color(0xFF1E1E1E); // Slightly lighter card background
  static const Color darkSectionBackground = Color(0xFF232323); // For sections
  static const Color darkScaffoldBackground = Color(0xFF121212); // Dark scaffold background
  static const Color darkAppBarBackground = Color(0xFF232323); // Dark AppBar background

  //Textfield Fill Color
  static const Color textfieldFillColor = Color(0x09FFFFFF); // Dark AppBar background

  // Borders
  static const Color darkBorder = Color(0xFF37474F); // Subtle dark border

  // Feedback Colors
  static const Color darkInformation = Color(0xFF007AFF); // Lighter green for better visibility
  static const Color darkWarning = Color(0xFFFFCA28); // A vibrant amber for warnings
  static const Color darkSuccess = Color(0xFF43A047); // Slightly darker green for success
  static const Color darkError = Color(0xFFEF5350); // Vibrant red for errors

  // Button Colors
  static const Color darkButtonBackground = darkPrimary;
  static const Color darkButtonText = white; // Black text for better visibility on buttons

  static List<Color> cardGradiant = [MyColor.lightSecondaryButton, MyColor.lightSecondary];

  //All Colors getters
// ===================== Getters for Colors =====================
  static Color getTransparentColor({bool isLightTheme = true}) => transparent;
  static Color getPrimaryColor({bool isLightTheme = true}) => isLightTheme ? lightPrimary : darkPrimary;
  static Color getSecondaryColor({bool isLightTheme = true}) => isLightTheme ? lightSecondary : darkSecondary;
  static Color getHeadingTextColor({bool isLightTheme = true}) => isLightTheme ? lightHeadingText : darkHeadingText;
  static Color getBodyTextColor({bool isLightTheme = true}) => isLightTheme ? lightBodyText : darkBodyText;
  static Color getAccent1Color({bool isLightTheme = true}) => isLightTheme ? lightAccent1 : darkAccent1;
  static Color getBackgroundColor({bool isLightTheme = true}) => isLightTheme ? lightBackground : darkBackground;
  static Color getCardBackgroundColor({bool isLightTheme = true}) => isLightTheme ? lightCardColor : darkCardBackground;
  static Color getSectionBackgroundColor({bool isLightTheme = true}) => isLightTheme ? lightSectionBackground : darkSectionBackground;
  static Color getScaffoldBackgroundColor({bool isLightTheme = true}) => isLightTheme ? lightScaffoldBackground : darkScaffoldBackground;
  static Color getBorderColor({bool isLightTheme = true}) => isLightTheme ? lightBorder : darkBorder;
  static Color getInformationColor({bool isLightTheme = true}) => isLightTheme ? lightInformation : darkInformation;
  static Color getWarningColor({bool isLightTheme = true}) => isLightTheme ? lightWarning : darkWarning;
  static Color getSuccessColor({bool isLightTheme = true}) => isLightTheme ? lightSuccess : darkSuccess;
  static Color getErrorColor({bool isLightTheme = true}) => isLightTheme ? lightError : darkError;
  static Color getButtonBackgroundColor({bool isLightTheme = true}) => isLightTheme ? lightButtonBackground : darkButtonBackground;
  static Color getButtonTextColor({bool isLightTheme = true}) => isLightTheme ? lightButtonText : darkButtonText;
}
