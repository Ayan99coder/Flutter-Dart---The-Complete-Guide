import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/view/bottomnav.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/viewModel/Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange,brightness: Brightness.dark),
  brightness: Brightness.dark,
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => MealProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: TabsScreen(),
    );
  }
}
