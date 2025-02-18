class UserModel {

  String? name;
  String? email;
  String? avatar;

  UserModel({this.avatar,this.email,this.name});

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      name: json["name"],
      email: json["email"],
      avatar: json["avatar"]
    );
  }

  Map<String,dynamic> toJson (){
    return {
      "name": name,
      "email": email,
      "avatar":avatar
    };
  }
}