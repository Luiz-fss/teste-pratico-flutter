import 'package:teste_pratico_medicina_direta/feature/data/models/user_models/user_model.dart';

class UserEntity {

  String? name;
  String? email;
  String? avatar;

  UserEntity({this.name,this.email,this.avatar});

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      name: model.name,
      email: model.email,
      avatar: model.avatar,
    );
  }
}