import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String skillName;
  final int level; // 0-100
  const SkillCard({Key? key, required this.skillName, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(skillName, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Stack(children: [
            Container(height: 10, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.16), borderRadius: BorderRadius.circular(8))),
            LayoutBuilder(builder: (context, constraints) {
              final w = (level / 100) * constraints.maxWidth;
              return Container(width: w, height: 10, decoration: BoxDecoration(gradient: LinearGradient(colors: [primary, Theme.of(context).colorScheme.secondary]), borderRadius: BorderRadius.circular(8)));
            })
          ]),
          const SizedBox(height: 8),
          Align(alignment: Alignment.centerRight, child: Text('$level%', style: Theme.of(context).textTheme.bodySmall)),
        ]),
      ),
    );
  }
}
