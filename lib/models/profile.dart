import 'portfolio.dart';
import 'skill.dart';

enum StudentStatus { aktif, cuti, lulus }

class Profile {
  final String nama;
  final String nim;
  final String jurusan;
  final String email;
  final String telepon;
  final List<String> hobi;
  final List<Skill> skill;
  final StudentStatus status;
  final List<Portfolio> portfolio;

  Profile({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.email,
    required this.telepon,
    required this.hobi,
    required this.skill,
    required this.status,
    required this.portfolio,
  });

  String getStatusText() {
    switch (status) {
      case StudentStatus.aktif:
        return 'Aktif';
      case StudentStatus.cuti:
        return 'Cuti';
      case StudentStatus.lulus:
        return 'Lulus';
    }
  }

  String initials() {
    final parts = nama.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}
