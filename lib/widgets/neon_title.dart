import 'package:flutter/material.dart';

class NeonTitle extends StatelessWidget {
  final String text;
  final double size;
  const NeonTitle({Key? key, required this.text, this.size = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w800,
        foreground: Paint()
          ..shader = LinearGradient(colors: [primary, Theme.of(context).colorScheme.secondary]).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
        shadows: [Shadow(color: primary.withOpacity(0.6), blurRadius: 10, offset: const Offset(0, 0))],
      ),
    );
  }
}
