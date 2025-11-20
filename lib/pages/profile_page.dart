import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_card.dart';
import '../widgets/hobby_item.dart';
import '../widgets/glowing_avatar.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;
  const ProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(child: GlowingAvatar(imagePath: 'assets/images/avatar.jpg', size: 120)),
          const SizedBox(height: 12),
          Center(child: Text(profile.nama, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold))),
          const SizedBox(height: 6),
          Center(child: Text(profile.jurusan, style: theme.textTheme.bodyMedium)),
          const SizedBox(height: 16),

          InfoCard(icon: Icons.badge, title: 'NIM', subtitle: profile.nim),
          InfoCard(icon: Icons.school, title: 'Jurusan', subtitle: profile.jurusan),
          InfoCard(icon: Icons.email, title: 'Email', subtitle: profile.email),
          InfoCard(icon: Icons.phone, title: 'Telepon', subtitle: profile.telepon),

          const SizedBox(height: 12),
          Text('Hobi', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SizedBox(
            height: 56,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profile.hobi.length,
              itemBuilder: (context, i) => HobbyItem(hobby: profile.hobi[i]),
            ),
          ),

          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Tentang Saya', style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
                Text('Saya adalah mahasiswa teknik informatika dengan minat di pengembangan aplikasi mobile dan UI/UX. Saya suka membangun prototype cepat dan bereksperimen dengan desain yang beragam.', style: theme.textTheme.bodyMedium),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
