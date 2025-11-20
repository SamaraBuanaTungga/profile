import 'package:flutter/material.dart';

class NeonButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? height;
  const NeonButton({Key? key, required this.label, required this.onTap, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [scheme.primary, scheme.secondary]),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: scheme.primary.withOpacity(0.28), blurRadius: 16, offset: const Offset(0, 8))],
        ),
        child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
      ),
    );
  }
}
