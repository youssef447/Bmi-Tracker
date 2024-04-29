
class UserModel {
  late final int id;
  late final String name, email;


  UserModel({
    required this.id,
    required this.email,
    required this.name,
  
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
     
      
    );
  }
}

