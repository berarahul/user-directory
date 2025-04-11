import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/app_linker.dart';
import '../../../user_list/presentation/provider/user_provier.dart';
import '../../domain/entities/adduser.dart';
import '../../domain/usecases/postuser_usecase.dart';

class AddUserProvider with ChangeNotifier {
  final PostUsersUsecase postUsersUsecase;

  AddUserProvider(this.postUsersUsecase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> addUser(AddUser user, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      await postUsersUsecase.call(user);
      Provider.of<UserProvider>(context, listen: false).getUsers();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User added successfully")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
