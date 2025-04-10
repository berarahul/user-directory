import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:user_directory/features/user_list/presentation/provider/user_provier.dart';

import 'data/datasources/user_api_service.dart';
import 'data/repositories/user_repositories_impl.dart';
import 'domain/usecases/fetch_user_usecase.dart';



List<SingleChildWidget> userListInjection = [
  ChangeNotifierProvider<UserProvider>(
    create: (_) {
      final datasource = UserApiService();
      final repository = UserRepositoryImpl(datasource);
      final usecase = FetchUsersUsecase(repository);
      return UserProvider(usecase);
    },
  ),
];
