import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0xFF1F88DB);

const Color accent = Color(0xFFf7a71e);

const Color bgColor = Color(0xFFfafafa);

const Color cardBg = Color(0xFFf6f5fb);

const Color darkGrey = Color(0xff292525);

const Color fb = Color(0xFF4267B2);

const Color red = Color(0xFFD82C68);

const Color white = Colors.white;

const Color black = Colors.black;

const Color grey = Colors.grey;

themeData(context) => ThemeData(
      textTheme: GoogleFonts.robotoTextTheme(
        Theme.of(context).textTheme,
      ),
      primarySwatch: Colors.blue,
      primaryColor: bgColor,
      brightness: Brightness.dark,
      backgroundColor: bgColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
