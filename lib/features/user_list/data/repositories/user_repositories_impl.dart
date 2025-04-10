
import '../../domain/entities/user_entitiy.dart';
import '../../domain/repositories/user_repositories.dart';
import '../datasources/user_api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<List<User>> getUsers() => apiService.fetchUsers();
}
