import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../add_user/presentation/screen/add_user_screen.dart';
import '../provider/user_provier.dart';
import '../widgets/searchbar.dart';
import '../widgets/user_card_view.dart';
import '../../../user_details/presentation/screen/user_details_screen.dart'; // Add this import

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch data once when screen loads
    Future.microtask(() {
      final provider = Provider.of<UserProvider>(context, listen: false);
      if (provider.users.isEmpty) {
        provider.getUsers();
      }
    });

    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Center(child: Text("User List")),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Consumer<UserProvider>(
            builder: (context, provider, _) {
              return CustomSearchBar(
                controller: searchController,
                onChanged: provider.updateSearchQuery,
              );
            },
          ),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.error != null) {
            return Center(child: Text(provider.error!));
          } else {
            final users = provider.usersbyname;
            return users.isEmpty
                ? const Center(child: Text("No users found."))
                : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailsScreen(user: user),
                      ),
                    );
                  },
                  child: UserCardView(
                    name: user.name,
                    email: user.email,
                    company: user.company,
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[200],
        elevation: 10,
        onPressed: ()  async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddUserScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
