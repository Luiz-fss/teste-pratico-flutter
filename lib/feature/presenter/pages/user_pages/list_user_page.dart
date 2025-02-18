import 'package:flutter/material.dart'; // Seu UseCase para pegar os usuários
import 'package:get/get.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/entities/user_entity/user_entity.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/usecases/user/get_users.dart';
import 'package:teste_pratico_medicina_direta/feature/routes/user_routes/user_routes.dart';

import '../../components/user_tile.dart';

class ListUserPage extends StatefulWidget {
  final GetUsers getUsersUseCase;
  ListUserPage({required this.getUsersUseCase});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  late Future<List<UserEntity>> _listUsers;

  @override
  void initState() {
    super.initState();
    _listUsers = widget.getUsersUseCase.userRepository.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de Usuários",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: _refreshUsers,
      child: FutureBuilder<List<UserEntity>>(
        future: _listUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: const Text(("Falha ao carregar os usuários")),
            );
          }
          return _buildListUser(snapshot.data!);
        },
      ),
    );
  }

  Widget _buildListUser(List<UserEntity> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: UserTile(
            userEntity: user,
            onTap: () {
              Get.toNamed(UserRoutes.USER_DETAIL, arguments: user);
            },
          ),
        );
      },
    );
  }

  Future<void> _refreshUsers() async {
    setState(() {
      _listUsers = widget.getUsersUseCase.execute();
    });
  }

}
