import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/menu_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color hijauTua = Color(0xFF1B5E20);
    const Color oranye = Color(0xFFFF9800);

    return GetMaterialApp(
      title: 'Pencatat Menu Kantin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: hijauTua,
          primary: hijauTua,
          secondary: oranye,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7F2),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: hijauTua,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: oranye,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MenuListPage(),
    );
  }
}
