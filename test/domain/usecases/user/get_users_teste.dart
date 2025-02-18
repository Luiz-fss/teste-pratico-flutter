import 'package:dio/dio.dart';
import 'package:teste_pratico_medicina_direta/feature/data/models/user_models/user_model.dart';
import 'package:teste_pratico_medicina_direta/feature/data/repositories/user_repository/user_repository_impl.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/entities/user_entity/user_entity.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/repositories/user_repository/user_repository.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/usecases/user/get_users.dart';
import 'package:flutter_test/flutter_test.dart';

class UserRepositoryWithForcedError implements UserRepository {
  @override
  Future<List<UserEntity>> getUsers() async {
    try{
      final dio = Dio();
      final response = await dio.get(""); // Intentionally wrong URL to simulate error.

      List<UserModel> userModels = (response.data as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList();

      return userModels.map((userModel) => UserEntity.fromModel(userModel)).toList();

    }catch(e){
      return [];
    }
  }
}

void main (){
  UserRepositoryImpl repositoryImpl = UserRepositoryImpl();
  UserRepositoryWithForcedError repositoryFail = UserRepositoryWithForcedError();;
  GetUsers getUsersUseCase = GetUsers(repositoryImpl);

  group("getUsers test", (){

    test("expected user list", () async {
      // Act
      final result = await getUsersUseCase.execute();

      // Assert
      expect(result, isA<List<UserEntity>>());
    });

    test("expected return an empty list in case of error",()async{
      GetUsers faiGetUsers = GetUsers(repositoryFail);

      //Act
      final result = await faiGetUsers.execute();

      //Assert
      expect(result, isA<List<UserEntity>>()); // Ensures it's a List
      expect(result.isEmpty, true);
    });

  });
}