class UserInfoResult {
  String? id;
  String? name;
  String email;
  String? birthday;
  int? country;
  int? gender;
  double? height;
  int? heightUnit;
  double? weight;
  int? weightUnit;
  String phoneNo;
  UserInfoResult({
    this.id,
    this.name,
    required this.email,
    this.birthday,
    this.country,
    this.gender,
    this.height,
    this.heightUnit,
    this.weight,
    this.weightUnit,
    required this.phoneNo,
  });

  factory UserInfoResult.fromMap(Map<Object?, dynamic> map) {
    return UserInfoResult(
      id: map['id'],
      name: map['name']?.toString(),
      email: map['email'],
      birthday: map['birthday']?.toString(),
      country: map['country']?.toInt(),
      gender: map['gender']?.toInt(),
      height: map['height']?.toDouble(),
      heightUnit: map['heightUnit']?.toInt(),
      weight: map['weight']?.toDouble(),
      weightUnit: map['weightUnit']?.toInt(),
      phoneNo: map['phoneNo'],
    );
  }
}
