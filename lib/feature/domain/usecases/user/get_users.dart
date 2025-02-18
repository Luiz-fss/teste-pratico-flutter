import 'package:teste_pratico_medicina_direta/feature/domain/entities/user_entity/user_entity.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/repositories/user_repository/user_repository.dart';

class GetUsers {
  final UserRepository userRepository;

  GetUsers(this.userRepository);

  Future<List<UserEntity>> execute ()async{
    return await userRepository.getUsers();
  }

}