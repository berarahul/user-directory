// import 'package:flutter/foundation.dart';
//
// import '../../domain/repositories/add_user_repositories.dart';
// import '../datasources/add_user_apiservice.dart';
// import '../model/add_user_model.dart';
//
// class AddUserRepoImpl implements AddUserRepo {
//   final AddUserApiservice remoteDataSource;
//
//   AddUserRepoImpl({required this.remoteDataSource});
//
//   @override
//   Future<void> addUser(AddUserModel addUserModel) async {
//     try {
//       await remoteDataSource.addUser(addUserModel);
//     } catch (e) {
//       debugPrint("Error in AddUserRepoImpl: $e");
//       rethrow;
//     }
//   }
// }


import '../../../../core/constant/app_linker.dart';
import '../../domain/entities/adduser.dart'; // 👈 entity
import '../../domain/repositories/add_user_repositories.dart';
import '../datasources/add_user_apiservice.dart';
import '../model/add_user_model.dart'; // 👈 model

class AddUserRepoImpl implements AddUserRepo {
  final AddUserApiservice remoteDataSource;

  AddUserRepoImpl({required this.remoteDataSource});

  @override
  Future<void> addUser(AddUser user) async {
    try {
      final addUserModel = AddUserModel(
        name: user.name,
        email: user.email,
        phonenumber: user.phonenumber,
        username: user.username,
        website: user.website,
        address: user.address,
        company: user.company,
      );

      await remoteDataSource.addUser(addUserModel);
    } catch (e) {
      debugPrint("🔴 Error in AddUserRepoImpl: $e");
      rethrow;
    }
  }
}
