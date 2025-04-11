import 'package:http/http.dart' as http;

import '../../../../core/constant/app_linker.dart';
import '../model/add_user_model.dart';

class AddUserApiservice {
  final http.Client client;

  AddUserApiservice(this.client);

  Future<void> addUser(AddUserModel adduser) async {
    final response = await client.post(

      Uri.parse("https://67f6cb5242d6c71cca6350be.mockapi.io/users"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(adduser.toJson()),
    );
    debugPrint("RAW RESPONSE: ${response.body}");
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception("Failed to add user");
    }
  }
}
