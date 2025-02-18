import 'package:get/get.dart';
import 'package:teste_pratico_medicina_direta/feature/presenter/pages/user_pages/list_user_page.dart';
import 'package:teste_pratico_medicina_direta/feature/presenter/pages/user_pages/user_detail_page.dart';

class UserRoutes {

  static const USER_LIST = "/user_list";
  static const USER_DETAIL = "/user_detail";

  static final routes = [
    GetPage(name: USER_LIST, page: () => ListUserPage(getUsersUseCase: Get.find())),
    GetPage(
      name: USER_DETAIL,
      page: () => UserDetailPage(selectedUser: Get.arguments),
    ),
  ];
}