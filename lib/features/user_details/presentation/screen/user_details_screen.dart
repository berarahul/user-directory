import 'package:flutter/material.dart';
import '../../../../core/constant/app_linker.dart';
import '../../../user_list/domain/entities/user_entitiy.dart';
import '../widgets/user_detail_tile.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=3',
            ),
          ),
          const SizedBox(height: 24),
          UserDetailTile(label: "Name", value: user.name),
          UserDetailTile(label: "Username", value: user.username),
          UserDetailTile(label: "Email", value: user.email),
          UserDetailTile(label: "Phone", value: user.phonenumber),
          UserDetailTile(label: "Website", value: user.website),
          UserDetailTile(label: "Address", value: user.address),
          UserDetailTile(label: "Company", value: user.company),


        ],
      ),
    );
  }
}
