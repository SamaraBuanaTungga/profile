import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  final String hobby;
  const HobbyItem({Key? key, required this.hobby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primary.withOpacity(0.16)),
      ),
      child: Center(child: Text(hobby, style: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}
