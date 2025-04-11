
import '../entities/adduser.dart';


abstract class AddUserRepo {
  Future<void> addUser(AddUser user);
}
