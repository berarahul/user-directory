import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_directory/features/add_user/presentation/widgets/user_input_form.dart';
import '../../../user_list/presentation/provider/user_provier.dart';
import '../../data/datasources/add_user_apiservice.dart';
import '../../data/repositories/adduser_repositories_impl.dart';
import '../../domain/entities/adduser.dart';
import '../../domain/usecases/postuser_usecase.dart';
import 'package:http/http.dart' as http;
class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  final PostUsersUsecase usecase = PostUsersUsecase(
    AddUserRepoImpl(
      remoteDataSource: AddUserApiservice(
        http.Client(),
      ), // <- This is your API class
    ),

  ); // Inject repo here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New User"),
        backgroundColor: Colors.blue,
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
          onSubmit: (AddUser user) async {
            try {
              await usecase.call(user); // ✅ Call the use case
              debugPrint("✅ User added successfully");
              final provider = Provider.of<UserProvider>(context, listen: false);
 provider.getUsers();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("User added successfully")),
              );
              Navigator.pop(context); // Optional: go back
            } catch (e) {
              debugPrint("❌ Error adding user: $e");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: $e")),
              );
            }
          },
        ),
      ),
    );
  }
}

