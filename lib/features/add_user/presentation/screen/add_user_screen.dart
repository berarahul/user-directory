import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/datasources/add_user_apiservice.dart';
import '../../data/repositories/adduser_repositories_impl.dart';
import '../../domain/entities/adduser.dart';
import '../../domain/usecases/postuser_usecase.dart';
import '../provider/add_user_provider.dart';
import '../widgets/user_input_form.dart';
import 'package:http/http.dart' as http;
class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  final websiteController = TextEditingController();
  final addressController = TextEditingController();
  final companyController = TextEditingController();

  final usecase = PostUsersUsecase(
    AddUserRepoImpl(
      remoteDataSource: AddUserApiservice(http.Client()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddUserProvider(usecase),
      child: Consumer<AddUserProvider>(
        builder: (context, provider, _) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.grey,
                appBar: AppBar(
                  title: const Text("Add New User"),
                  backgroundColor: Colors.grey[200],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: UserInputForm(
                    formKey: _formKey,
                    nameController: nameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    usernameController: usernameController,
                    websiteController: websiteController,
                    addressController: addressController,
                    companyController: companyController,
                    onSubmit: (AddUser user) {
                      provider.addUser(user, context);
                    },
                  ),
                ),
              ),
              if (provider.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
