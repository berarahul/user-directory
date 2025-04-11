import 'package:user_directory/features/add_user/domain/entities/adduser.dart';

class AddUserModel extends AddUser{


  AddUserModel({
    required super.name,
    required super.email,
    required super.company,
    required super.phonenumber,
    required super.address,
    required super.website,
    required super.username,

  });

  // Convert model to JSON (for POST request)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'company': company,
      'phonenumber': phonenumber,
      'address': address,
      'website': website,
      'username': username,
       // include if present
    };
  }


}
