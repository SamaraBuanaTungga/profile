import 'dart:async';
import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  final Profile profile;
  final VoidCallback onThemeToggle;
  final bool isDark;
  const SplashPage({Key? key, required this.profile, required this.onThemeToggle, required this.isDark}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  double progress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (t) {
      setState(() {
        progress += 0.02;
        if (progress >= 1.0) {
          _timer.cancel();
          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage(profile: widget.profile, onThemeToggle: widget.onThemeToggle, isDark: widget.isDark)));
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: theme.brightness == Brightness.dark
                ? [const Color(0xFF0B0B14), const Color(0xFF1A102A)]
                : [const Color(0xFFF6F6F9), const Color(0xFFEAF7FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Sam Profile', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: theme.colorScheme.secondary)),
              const SizedBox(height: 20),
              Container(
                width: 220,
                height: 6,
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    FractionallySizedBox(widthFactor: progress, child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [theme.colorScheme.primary, theme.colorScheme.secondary]), borderRadius: BorderRadius.circular(10)))),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text('${(progress * 100).clamp(0, 100).toInt()}%', style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
