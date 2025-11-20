import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/glowing_avatar.dart';
import '../widgets/neon_button.dart';
import 'profile_page.dart';
import 'skills_page.dart';
import 'portfolio_page.dart';

class HomePage extends StatelessWidget {
  final Profile profile;
  final VoidCallback onThemeToggle;
  final bool isDark;
  const HomePage({Key? key, required this.profile, required this.onThemeToggle, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: theme.textTheme.titleMedium),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: onThemeToggle,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [theme.colorScheme.primary.withOpacity(0.14), theme.colorScheme.secondary.withOpacity(0.08)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                GlowingAvatar(imagePath: 'assets/images/avatar.jpg', size: 92),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile.nama, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(profile.jurusan, style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.secondary.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(profile.getStatusText(), style: theme.textTheme.bodySmall),
                          ),
                          const SizedBox(width: 10),
                          Text('NIM: ${profile.nim}', style: theme.textTheme.bodySmall),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 18),
          // Buttons
          Row(
            children: [
              Expanded(child: NeonButton(label: 'Profile', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage(profile: profile))))),
              const SizedBox(width: 12),
              Expanded(child: NeonButton(label: 'Skills', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SkillsPage(profile: profile))))),
              const SizedBox(width: 12),
              Expanded(child: NeonButton(label: 'Portfolio', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PortfolioPage(profile: profile))))),
            ],
          ),
          const SizedBox(height: 20),
          // Quick info cards
          Text('Quick Info', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          // Wrap(
          //   spacing: 12,
          //   runSpacing: 12,
          //   children: [
          //     _quickInfoCard(context, Icons.email, 'Email', profile.email),
          //     _quickInfoCard(context, Icons.phone, 'Telepon', profile.telepon),
          //     _quickInfoCard(context, Icons.school, 'Jurusan', profile.jurusan),
          //     _quickInfoCard(context, Icons.folder, 'Projects', '${profile.portfolio.length}'),
          //   ],
          // ),
          LayoutBuilder(
            builder: (context, constraints) {

              // Jika lebar layar kurang dari 400px → jadi 1 kolom
              bool isSmallScreen = constraints.maxWidth < 400;

              double itemWidth = isSmallScreen
                  ? constraints.maxWidth   // 1 baris 1 item
                  : (constraints.maxWidth - 24) / 2; // 2 kolom

              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  SizedBox(
                    width: itemWidth,
                    child: _quickInfoCard(context, Icons.email, 'Email', profile.email),
                  ),
                  SizedBox(
                    width: itemWidth,
                    child: _quickInfoCard(context, Icons.phone, 'Telepon', profile.telepon),
                  ),
                  SizedBox(
                    width: itemWidth,
                    child: _quickInfoCard(context, Icons.school, 'Jurusan', profile.jurusan),
                  ),
                  SizedBox(
                    width: itemWidth,
                    child: _quickInfoCard(context, Icons.folder, 'Projects', '${profile.portfolio.length}'),
                  ),
                ],
              );
            },
          )

        ],
      ),
    );
  }

  Widget _quickInfoCard(BuildContext context, IconData icon, String title, String subtitle) {
    final theme = Theme.of(context);
    return Container(
      width: (MediaQuery.of(context).size.width - 64) / 2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: theme.colorScheme.primary.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 6))
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: theme.colorScheme.primary.withOpacity(0.14), child: Icon(icon, color: theme.colorScheme.primary)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: theme.textTheme.bodySmall), const SizedBox(height: 6), Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600))])),
        ],
      ),
    );
  }
}
