class Portfolio {
  final String title;
  final String description;
  final String image; // asset path or url
  final List<String> techStack;
  final String githubUrl;
  final int year;

  Portfolio({
    required this.title,
    required this.description,
    required this.image,
    required this.techStack,
    required this.githubUrl,
    required this.year,
  });

  String shortDescription([int limit = 80]) {
    if (description.length <= limit) return description;
    return description.substring(0, limit) + '...';
  }
}
