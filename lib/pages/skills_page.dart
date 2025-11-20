import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/skill_card.dart';

class SkillsPage extends StatelessWidget {
  final Profile profile;
  const SkillsPage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skills = profile.skill;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Skills')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: skills.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : MediaQuery.of(context).size.width > 500 ? 2 : 1,
            mainAxisExtent: 110,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, i) => SkillCard(
            skillName: skills[i].name,
            level: skills[i].level,
          ),          
        ),
      ),
    );
  }
}
