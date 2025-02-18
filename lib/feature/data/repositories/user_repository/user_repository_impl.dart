import 'package:dio/dio.dart';
import 'package:teste_pratico_medicina_direta/feature/data/models/user_models/user_model.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/entities/user_entity/user_entity.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/repositories/user_repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{

  @override
  Future<List<UserEntity>> getUsers() async{
   try{
     final dio = Dio();
     final response = await dio.get("https://jsonplaceholder.typicode.com/users");

     List<UserModel> userModels = (response.data as List)
         .map((userJson) => UserModel.fromJson(userJson))
         .toList();

     return userModels.map((userModel) => UserEntity.fromModel(userModel)).toList();

   }catch(e){
     return [];
   }
  }
}