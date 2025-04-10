import '../../domain/entities/user_entitiy.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.company,
    required super.username,
    required super.phonenumber,
    required super.website,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      company: json['company'] is Map<String, dynamic>
          ? json['company']['name'] ?? ''
          : json['company'] ?? '',
      username: json['username'] ?? '',
      phonenumber: json['phonenumber'] ?? '',
      website: json['website'] ?? '',
      address: json['address'] ?? '',
    );
  }


}
