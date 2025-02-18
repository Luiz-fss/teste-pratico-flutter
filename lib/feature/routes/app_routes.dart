import 'package:teste_pratico_medicina_direta/feature/routes/user_routes/user_routes.dart';

class AppRoutes {

  static const INITIAL = UserRoutes.USER_LIST;

  static final routes = [
    ...UserRoutes.routes,
  ];
}