class JobModel {
  final String title;
  final String id;
  final String companyName;
  final String location;
  final String salaryPerHour;
  final String jobType;
  final String companyLogo;
  final String homeScreenRole;
  final List<String>? appliedDevelopers;
  final List<String> requirements;

  JobModel({
    required this.title,
    required this.companyName,
    required this.location,
    required this.salaryPerHour,
    required this.jobType,
    required this.companyLogo,
    required this.id,
    this.requirements = const [],
    this.homeScreenRole = '',
    this.appliedDevelopers,
  });
}

class JobType {
  static const intern = 'intern';
  static const fullTime = 'full_time';
  static const junior = 'junior';
}

class HomeScreenRole {
  static const recommended = 'recommended';
}
