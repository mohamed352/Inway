import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor:  Colors.white,
    textTheme: GoogleFonts.alexandriaTextTheme(ThemeData.light().textTheme),
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 25,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10,
      selectedIconTheme: const IconThemeData(color: Colors.black, size: 25),
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(color: Colors.grey.shade400, size: 25),
      unselectedItemColor: Colors.grey.shade400,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white, backgroundColor: ColorApp.lightblue));
SystemUiOverlayStyle lightStatusBar = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark);
