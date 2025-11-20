import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/splash_page.dart';
import 'models/profile.dart';
import 'models/portfolio.dart';
import 'models/skill.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  // Dummy global profile data (you can replace with real data)
  late final Profile demoProfile = Profile(
    nama: 'Samara Buana Tungga',
    nim: '23552011126',
    jurusan: 'Teknik Informatika',
    email: 'samarabuana@gmail.com',
    telepon: '+62 882-2916-2240',
    hobi: ['Movie', 'Musik', 'Kuliner', 'Travelling'],
    skill: [      
      Skill(name: 'Flutter', level: 80),
      Skill(name: 'HTML & CSS', level: 85),
      Skill(name: 'Java', level: 85),
      Skill(name: 'UI/UX', level: 80),
      Skill(name: 'SQLite', level: 70),
      Skill(name: 'MySQL / PostgreSQL', level: 95),
      Skill(name: 'OOP', level: 90),
    ],
    status: StudentStatus.aktif,
    portfolio: [
      Portfolio(
        title: 'POS Café',
        description: 'Aplikasi kasir modern dengan SQLite, fitur laporan, dan UI interaktif.',
        image: 'assets/images/posapp.png',
        techStack: ['Flutter', 'SQLite'],
        githubUrl: 'https://github.com/SamaraBuanaTungga/pos_cafe.git',
        year: 2025,
      ),
      Portfolio(
        title: 'Katalog Digital',
        description: 'Website katalog produk interaktif dengan UI modern untuk menampilkan item secara visual.',
        image: 'assets/images/katalog.png',
        techStack: ['PHP', 'HTML', 'CSS'],
        githubUrl: 'https://github.com/SamaraBuanaTungga/katalog_produk_digital.git',
        year: 2025,
      ),

      Portfolio(
        title: 'CareLink',
        description: 'Website informasi kesehatan dengan artikel, filter dokter, dan sistem pencarian.',
        image: 'assets/images/carelink.png',
        techStack: ['PHP', 'HTML', 'CSS', 'JavaScript'],
        githubUrl: 'https://github.com/SamaraBuanaTungga/CareLink.git',
        year: 2025,
      ),

      Portfolio(
        title: 'Payroll',
        description: 'Aplikasi desktop untuk penggajian karyawan lengkap dengan perhitungan otomatis.',
        image: 'assets/images/payroll.png',
        techStack: ['Java', 'MySQL'],
        githubUrl: 'https://github.com/SamaraBuanaTungga/Project_UAS_Sistem_Penggajian.git',
        year: 2023,
      ),

      Portfolio(
        title: 'To Do List',
        description: 'Website manajemen tugas sederhana dengan fitur tambah, hapus, dan status penyelesaian.',
        image: 'assets/images/todolist.png',
        techStack: ['HTML', 'Springboot', 'JavaScript'],
        githubUrl: 'https://github.com/SamaraBuanaTungga/ToDo_List_Springboot',
        year: 2024,
      ),
    ],
  );

  ThemeData _lightTheme() {
    const electricBlue = Color(0xFF00E5FF);
    const neonPink = Color(0xFFFF00C8);
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: electricBlue,
      scaffoldBackgroundColor: const Color(0xFFF6F6F9),
      colorScheme: ColorScheme.fromSeed(seedColor: electricBlue).copyWith(secondary: neonPink),
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
      ),

    );
  }

  ThemeData _darkTheme() {
    const electricBlue = Color(0xFF00E5FF);
    const neonPink = Color(0xFFFF00C8);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: electricBlue,
      scaffoldBackgroundColor: const Color(0xFF1A102A),
      colorScheme: ColorScheme.fromSeed(seedColor: electricBlue, brightness: Brightness.dark).copyWith(secondary: neonPink),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2A1A40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
      ),
    );
  }

  void toggleTheme() => setState(() => isDark = !isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        '/': (_) => SplashPage(profile: demoProfile, onThemeToggle: toggleTheme, isDark: isDark),
      },
    );
  }
}
