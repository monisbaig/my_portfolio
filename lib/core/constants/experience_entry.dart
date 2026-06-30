part of 'constants.dart';

class ExperienceEntry {
  const ExperienceEntry({
    required this.company,
    required this.title,
    required this.dateRange,
    required this.location,
    required this.responsibilities,
    this.tabLabel,
  });

  final String company;
  final String title;
  final String dateRange;
  final String location;
  final List<String> responsibilities;
  final String? tabLabel;

  String get displayTabLabel => tabLabel ?? company;
}
