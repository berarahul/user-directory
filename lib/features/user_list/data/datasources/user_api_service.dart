import 'dart:convert';

import '../model/usermodel.dart';
import 'package:http/http.dart' as http;
class UserApiService {
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://67f6cb5242d6c71cca6350be.mockapi.io/users'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch users");
    }
  }
}
