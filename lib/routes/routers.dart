import 'package:go_router/go_router.dart';
import 'package:kakao_map_sdk_example/routes/menu_routes.dart';
import 'package:kakao_map_sdk_example/screens/kakao_map_view.dart';
import 'package:kakao_map_sdk_example/screens/menu/home_menu.dart';

var routes = MenuRoutes.values.map((element) {
  return GoRoute(
      path: element.menuInfo.id, builder: (context, state) => element.widget);
}).toList();
var router = GoRouter(routes: [
  ShellRoute(
      builder: (context, state, widget) => KakaoMapView(menuPage: widget),
      routes: routes)
], initialLocation: HomeMenu.menuInfo.id);
