import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/portfolio_card.dart';
import 'portfolio_detail_page.dart';

class PortfolioPage extends StatelessWidget {
  final Profile profile;
  const PortfolioPage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = profile.portfolio;
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: projects.length,
        itemBuilder: (context, i) {
          final p = projects[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PortfolioDetailPage(portfolio: p))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: PortfolioCard(portfolio: p),
            ),
          );
        },
      ),
    );
  }
}
