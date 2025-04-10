import 'package:flutter/material.dart';

class UserCardView extends StatelessWidget {
  final String name;
  final String email;
  final String company;

  const UserCardView({
    super.key,
    required this.name,
    required this.email,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SizedBox(
        width: double.infinity, // 👈 This makes card full width
        child: Card(
          color: Colors.grey,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text("Email: $email"),
                Text("Company: $company"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
