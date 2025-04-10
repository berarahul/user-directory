class AddUserModel {
  final String name;
  final String email;
  final String company;
  final String phonenumber;
  final String address;
  final String website;
  final String username;

  // Optional: If you're generating ID on server side, you can omit this in POST
  final String? id;

  AddUserModel({
    required this.name,
    required this.email,
    required this.company,
    required this.phonenumber,
    required this.address,
    required this.website,
    required this.username,
    this.id,
  });

  // Convert model to JSON (for POST request)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'company': company,
      'phonenumber': phonenumber,
      'address': address,
      'website': website,
      'username': username,
      if (id != null) 'id': id, // include if present
    };
  }

  // (Optional) From JSON - if you need it later
  factory AddUserModel.fromJson(Map<String, dynamic> json) {
    return AddUserModel(
      name: json['name'],
      email: json['email'],
      company: json['company'],
      phonenumber: json['phonenumber'],
      address: json['address'],
      website: json['website'],
      username: json['username'],
      id: json['id'],
    );
  }
}
