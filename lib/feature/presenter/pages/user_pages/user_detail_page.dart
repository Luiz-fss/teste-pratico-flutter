import 'package:flutter/material.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/entities/user_entity/user_entity.dart';
import 'package:teste_pratico_medicina_direta/feature/presenter/components/user_tile.dart';

class UserDetailPage extends StatelessWidget {
  final UserEntity selectedUser;
  UserDetailPage({super.key, required this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "${selectedUser.name}",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: UserTile(userEntity: selectedUser)),
    );
  }
}
