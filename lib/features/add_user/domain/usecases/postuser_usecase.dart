import 'package:user_directory/features/add_user/data/model/add_user_model.dart';
import 'package:user_directory/features/add_user/domain/entities/adduser.dart';
import '../repositories/add_user_repositories.dart';

class PostUsersUsecase {
  final AddUserRepo repository;

  PostUsersUsecase(this.repository);

  Future<void> call(AddUser addUser) async {
    return await repository.addUser(addUser);
  }
}
