import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expenses_application/widgets/expenses.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme1 = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 96, 59, 181),
    );

    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme1,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme1.onPrimaryContainer,
          foregroundColor: colorScheme1.primaryContainer,
        ),
        cardTheme: CardTheme(
          color: colorScheme1.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme1.primaryContainer,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: colorScheme1.onSecondaryContainer,
            fontSize: 14.0,
          ),
        ),
      ),
      home: Expenses(),
    );
  }
}
