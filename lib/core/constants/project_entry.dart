part of 'constants.dart';

class ProjectEntry {
  const ProjectEntry({
    required this.title,
    required this.description,
    required this.technologies,
    this.externalUrl,
  });

  final String title;
  final String description;
  final List<String> technologies;
  final String? externalUrl;
}
