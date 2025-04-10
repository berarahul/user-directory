import '../../data/model/add_user_model.dart';
import '../entities/adduser.dart';

// abstract class AddUserRepo {
//   Future<void> addUser(AddUserModel addUserModel);
// }

abstract class AddUserRepo {
  Future<void> addUser(AddUser user); // entity
}
