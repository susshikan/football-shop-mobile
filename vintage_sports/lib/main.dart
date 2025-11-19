import 'package:flutter/material.dart';
import 'package:vintage_sports/screens/login.dart';
import 'package:vintage_sports/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final baseColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF800020), // burgundy
      brightness: Brightness.light,
    );

    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Vintage Sports',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: baseColorScheme.copyWith(
            primary: const Color(0xFF800020), // burgundy
            secondary: const Color(0xFFB8860B), // gold
            background: const Color(0xFFF8F8F8),
            surface: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFFF8F8F8),
          fontFamily: 'Inter',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF1A1A1A),
            elevation: 0.5,
            centerTitle: false,
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.black12.withOpacity(0.06)),
            ),
          ),
          textTheme: ThemeData.light().textTheme.apply(
                bodyColor: const Color(0xFF1A1A1A),
                displayColor: const Color(0xFF1A1A1A),
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
