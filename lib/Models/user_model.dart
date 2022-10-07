class AppUser {
  final bool isAuthenticated;
  final String name;
  final String email;
  final String id;
  final String imgUrl;
  final UserProfile? profile;

  AppUser({
    this.isAuthenticated = false,
    required this.name,
    required this.email,
    required this.id,
    this.imgUrl = '',
    this.profile,
  });
}

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
