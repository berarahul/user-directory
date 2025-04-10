// import 'package:flutter/material.dart';
// import 'package:user_directory/features/add_user/presentation/widgets/user_textfield.dart';
//
//
// class UserInputForm extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//
//   final TextEditingController nameController;
//   final TextEditingController emailController;
//   final TextEditingController phoneController;
//   final TextEditingController usernameController;
//   final TextEditingController websiteController;
//   final TextEditingController addressController;
//   final TextEditingController companyController;
//
//   const UserInputForm({
//     Key? key,
//     required this.formKey,
//     required this.nameController,
//     required this.emailController,
//     required this.phoneController,
//     required this.usernameController,
//     required this.websiteController,
//     required this.addressController,
//     required this.companyController,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: ListView(
//         children: [
//           UserTextField(controller: nameController, label: "Name"),
//           UserTextField(controller: usernameController, label: "Username"),
//           UserTextField(
//             controller: emailController,
//             label: "Email",
//             keyboardType: TextInputType.emailAddress,
//           ),
//           UserTextField(
//             controller: phoneController,
//             label: "Phone",
//             keyboardType: TextInputType.phone,
//           ),
//           UserTextField(controller: websiteController, label: "Website"),
//           UserTextField(controller: addressController, label: "Address"),
//           UserTextField(controller: companyController, label: "Company"),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (formKey.currentState!.validate()) {
//                 // handle submit here
//                 print("Form Submitted");
//               }
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//             child: const Text("Submit"),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:user_directory/features/add_user/presentation/widgets/user_textfield.dart';
import '../../domain/entities/adduser.dart';

class UserInputForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController usernameController;
  final TextEditingController websiteController;
  final TextEditingController addressController;
  final TextEditingController companyController;

  final void Function(AddUser user) onSubmit; // 👈 callback for submit

  const UserInputForm({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.usernameController,
    required this.websiteController,
    required this.addressController,
    required this.companyController,
    required this.onSubmit, // 👈 pass this from screen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          UserTextField(controller: nameController, label: "Name"),
          UserTextField(controller: usernameController, label: "Username"),
          UserTextField(
            controller: emailController,
            label: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          UserTextField(
            controller: phoneController,
            label: "Phone",
            keyboardType: TextInputType.phone,
          ),
          UserTextField(controller: websiteController, label: "Website"),
          UserTextField(controller: addressController, label: "Address"),
          UserTextField(controller: companyController, label: "Company"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final newUser = AddUser(
                  name: nameController.text,
                  email: emailController.text,
                  phonenumber: phoneController.text,
                  username: usernameController.text,
                  website: websiteController.text,
                  address: addressController.text,
                  company: companyController.text,
                );

                onSubmit(newUser); // 👈 call the callback
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
