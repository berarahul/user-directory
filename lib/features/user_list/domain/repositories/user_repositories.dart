
import '../entities/user_entitiy.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
