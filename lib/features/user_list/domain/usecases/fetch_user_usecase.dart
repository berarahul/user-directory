
import '../entities/user_entitiy.dart';
import '../repositories/user_repositories.dart';

class FetchUsersUsecase {
  final UserRepository repository;

  FetchUsersUsecase(this.repository);

  Future<List<User>> call() => repository.getUsers();
}
