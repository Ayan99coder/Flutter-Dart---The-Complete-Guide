import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiscreen_app_riverpod/view/categories_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: CategoriesScreen(),
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrangeAccent,
            brightness: .dark,
          ),
          brightness: .dark,
        ),
      ),
    ),
  );
}
