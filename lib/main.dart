import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_pratico_medicina_direta/feature/data/repositories/user_repository/user_repository_impl.dart';
import 'package:teste_pratico_medicina_direta/feature/domain/usecases/user/get_users.dart';
import 'package:teste_pratico_medicina_direta/feature/presenter/pages/user_pages/list_user_page.dart';
import 'package:teste_pratico_medicina_direta/feature/routes/user_routes/user_routes.dart';

import 'feature/domain/repositories/user_repository/user_repository.dart';

void main() {
  Get.put<UserRepository>(UserRepositoryImpl());
  Get.put<GetUsers>(GetUsers(Get.find()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Teste Prático - Medicina Direta',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color.fromARGB(255, 0, 0, 255)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: UserRoutes.USER_LIST,
      getPages: UserRoutes.routes,
    );
  }
}
