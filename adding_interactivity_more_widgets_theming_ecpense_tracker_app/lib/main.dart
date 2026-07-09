import 'package:adding_interactivity_more_widgets_theming_ecpense_tracker_app/view/expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Viewmodel/Provider.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

 // SystemChrome.setPreferredOrientations([
 //   DeviceOrientation.portraitUp,
 // ]).then((_) {

  runApp(
    ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: const MyApp(),
    ) );
//});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4), // Deep Purple
      brightness: Brightness.light,
    );
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: Brightness.dark,
    );
    return MaterialApp(
      home: ExpenseScreen(),
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        cardTheme: CardThemeData(
          color: darkColorScheme.secondaryContainer,
          margin: .all(10),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: lightColorScheme.primaryContainer,
          foregroundColor: lightColorScheme.onPrimaryContainer,
          centerTitle: true,
          toolbarHeight: 60,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: lightColorScheme.primary,
            side: BorderSide(
              color: lightColorScheme.primary,
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: lightColorScheme.surface,
          elevation: 2,
          margin: const EdgeInsets.all(10),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: lightColorScheme.primary,
          ),
        ),
        iconTheme:  IconThemeData(
          color: lightColorScheme.primary,
          size: 24,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(

          titleLarge: TextStyle(
            color: lightColorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),

          titleMedium: TextStyle(
            color: lightColorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),

          bodyMedium: TextStyle(
            color: lightColorScheme.onSurface,
          ),

        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}
