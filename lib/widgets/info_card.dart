import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const InfoCard({Key? key, required this.icon, required this.title, required this.subtitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(child: Icon(icon, size: 18, color: theme.colorScheme.primary), backgroundColor: theme.colorScheme.primary.withOpacity(0.12)),
        title: Text(title),
        subtitle: Text(subtitle),
        // trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
