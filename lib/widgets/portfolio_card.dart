import 'package:flutter/material.dart';
import '../models/portfolio.dart';

class PortfolioCard extends StatelessWidget {
  final Portfolio portfolio;
  const PortfolioCard({Key? key, required this.portfolio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Row(children: [
        ClipRRect(borderRadius: const BorderRadius.horizontal(left: Radius.circular(14)), child: Image.asset(portfolio.image, width: 110, height: 90, fit: BoxFit.cover)),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(portfolio.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(portfolio.shortDescription(80), style: theme.textTheme.bodySmall),
              const SizedBox(height: 8),
              Wrap(spacing: 6, children: portfolio.techStack.map((t) => Chip(label: Text(t, style: const TextStyle(fontSize: 12)))).toList())
            ]),
          ),
        ),
      ]),
    );
  }
}
