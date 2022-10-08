class AppUser {
  final bool isAuthenticated;
  final String name;
  final String email;
  final String id;
  final String imgUrl;
  final UserMainProfile? mainProfile;
  final UserProfile? profile;

  AppUser({
    this.isAuthenticated = false,
    required this.name,
    required this.email,
    required this.id,
    this.imgUrl = '',
    this.profile,
    this.mainProfile,
  });
}

class UserMainProfile {
  final String role;
  final String about;
  final String imgUrl;
  final List<UserExperience>? experiences;
  final List<UserEducation>? resumes;

  UserMainProfile({
    this.role = '',
    this.about = '',
    this.experiences,
    this.resumes,
    this.imgUrl = '',
  });
}

class UserExperience {
  final String startToEndDate;
  final String location;
  final String position;
  final String company;

  UserExperience({
    required this.startToEndDate,
    required this.location,
    required this.position,
    required this.company,
  });
}

class UserEducation {
  final String startToEndDate;
  final String location;
  final String course;
  final String school;

  UserEducation({
    required this.startToEndDate,
    required this.location,
    required this.course,
    required this.school,
  });
}

// .
// .
// .
// .
// .
// .
class UserProfile {
  final String accountType;
  final String ocupationStatus;
  final String gender;
  final String? businessName;
  final String? businessSector;
  final String address;
  final String city;
  final String state;
  final String country;

  UserProfile({
    required this.accountType,
    required this.ocupationStatus,
    required this.gender,
    this.businessName,
    this.businessSector,
    required this.address,
    required this.city,
    this.state = 'Rivers',
    this.country = 'Nigeria',
  });
}

// .
// .
// .
// .
// .
// .
// .
// Other custom classess
class AccountType {
  static const individual = 'individual';
  static const business = 'business';
}

class Gender {
  static const male = 'male';
  static const female = 'female';
}

class OcupationStatus {
  static const unemployed = 'unemployed';
}
