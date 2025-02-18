
import 'package:teste_pratico_medicina_direta/feature/domain/entities/user_entity/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers ();
}