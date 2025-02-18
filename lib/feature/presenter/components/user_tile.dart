import 'package:flutter/material.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/entities/user_entity/user_entity.dart';

class UserTile extends StatelessWidget {
  UserEntity userEntity;
  VoidCallback? onTap;

  UserTile({super.key,required this.userEntity, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildUserAvatar(userEntity.avatar ?? ""),
      title: Text(userEntity.name ?? ""),
      subtitle: Text(userEntity.email ?? ""),
      onTap: onTap ?? () {}
    );
  }

  Widget _buildUserAvatar(String avatar) {
    if (avatar.isEmpty) {
      return const CircleAvatar(
        child: Icon(Icons.person),
      );
    }
    return CircleAvatar(
      backgroundImage: NetworkImage(avatar),
    );
  }

}
