import 'package:flutter/material.dart';
import 'package:kakao_map_sdk_example/models/menu_info.dart';
import 'package:kakao_map_sdk_example/screens/menu/camera_option_menu.dart';
import 'package:kakao_map_sdk_example/screens/menu/home_menu.dart';
import 'package:kakao_map_sdk_example/screens/menu/map_setting_menu.dart';
import 'package:kakao_map_sdk_example/screens/menu/navigation_menu.dart';
// import 'package:kakao_map_sdk_example/pages/menu/poi_overlay_menu.dart';

enum MenuRoutes {
  homeMenu(HomeMenu.menuInfo, HomeMenu()),
  cameraOptionMenu(CameraOptionMenu.menuInfo, CameraOptionMenu()),
  // poiOvarlayMenu(PoiOverlayMenu.menuInfo, PoiOverlayMenu()),
  navigationMenu(NavigationMenu.menuInfo, NavigationMenu()),
  mapSettingMenu(MapSettingMenu.menuInfo, MapSettingMenu());

  final MenuInfo menuInfo;
  final StatefulWidget widget;

  const MenuRoutes(this.menuInfo, this.widget);
}
