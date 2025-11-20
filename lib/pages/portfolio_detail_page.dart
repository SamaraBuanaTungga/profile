import 'package:flutter/material.dart';
import '../models/portfolio.dart';
import '../widgets/neon_button.dart';

class PortfolioDetailPage extends StatelessWidget {
  final Portfolio portfolio;
  const PortfolioDetailPage({Key? key, required this.portfolio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(portfolio.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(portfolio.image, fit: BoxFit.cover, height: 220, width: double.infinity),
          ),
          const SizedBox(height: 12),
          Text(portfolio.title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Row(children: [Text('Year: ${portfolio.year}'), const SizedBox(width: 12), ...portfolio.techStack.map((t) => Padding(padding: const EdgeInsets.only(right: 8.0), child: Chip(label: Text(t))))]),
          const SizedBox(height: 12),
          Text(portfolio.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 18),
          NeonButton(label: 'Open GitHub', onTap: () {
            // placeholder: implement url_launcher if desired
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Open GitHub (not implemented)')));
          }),
        ],
      ),
    );
  }
}
