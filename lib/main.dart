import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/user_list/presentation/screen/user_list.dart';
import 'features/user_list/user_list_injection.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ...userListInjection, // Inject everything related to UserList feature

      ],
      child: const MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Directory',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserListScreen(),
    );
  }
}
