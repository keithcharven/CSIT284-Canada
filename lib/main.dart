import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFF00E5FF), 
  background: Colors.black,
  surface: const Color(0xFF121212),
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.black,
          foregroundColor: const Color(0xFF00E5FF),
          elevation: 0,
        ),
        cardTheme: const CardTheme().copyWith(
          color: const Color(0xFF121212),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shadowColor: const Color(0xFF00E5FF).withOpacity(0.2),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00E5FF),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          ThemeData.dark().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 22,
            ),
            bodyMedium: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ),
      ),
      home: const ExpensesScreen(),
    ),
  );
}

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add interaction logic here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No expenses found. Start adding some!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}