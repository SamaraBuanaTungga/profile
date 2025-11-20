import 'package:flutter/material.dart';

class GlowingAvatar extends StatefulWidget {
  final String imagePath;
  final double size;
  const GlowingAvatar({Key? key, required this.imagePath, this.size = 80}) : super(key: key);

  @override
  State<GlowingAvatar> createState() => _GlowingAvatarState();
}

class _GlowingAvatarState extends State<GlowingAvatar> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return ScaleTransition(
      scale: Tween<double>(begin: 0.995, end: 1.02).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut)),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [primary.withOpacity(0.28), Colors.transparent]),
          boxShadow: [BoxShadow(color: primary.withOpacity(0.18), blurRadius: 14, spreadRadius: 1)],
        ),
        child: CircleAvatar(
          radius: widget.size / 2,
          backgroundImage: AssetImage(widget.imagePath),
        ),
      ),
    );
  }
}
