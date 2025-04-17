import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_map_sdk_example/screens/components/control/checkbox.dart';
import 'package:kakao_map_sdk_example/screens/components/control/dropdown.dart';
import 'package:kakao_map_sdk_example/screens/components/title_component.dart';
import 'package:kakao_map_sdk_example/models/menu_info.dart';

class MapSettingMenu extends StatefulWidget {
  const MapSettingMenu({super.key});

  @override
  State<MapSettingMenu> createState() => _MapSettingMenuState();

  static const MenuInfo menuInfo = MenuInfo(
      "/map_setting", "지도 설정", "지도를 설정하는 기능입니다.", FontAwesomeIcons.gear, true);
}

class _MapSettingMenuState extends State<MapSettingMenu> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TitleComponent(
            title: MapSettingMenu.menuInfo.title,
            backEnabled: true,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(spacing: 2, children: [
              ControlCheckbox(
                  title: "나침판 활성화",
                  titleTextStyle: controllerTitleText,
                  onChanged: (value) {}),
              ControlCheckbox(
                  title: "축적바 활성화",
                  titleTextStyle: controllerTitleText,
                  onChanged: (value) {}),
              ControlDropdown(
                  title: "지도 유형",
                  titleTextStyle: controllerTitleText,
                  values: ["일반", "스카이뷰"],
                  onChanged: (value) {}),
              ControlDropdown(
                  title: "나침판 위치",
                  titleTextStyle: controllerTitleText,
                  values: ["좌측 상단", "좌측 상단", "우측 하단", "우측 상단"],
                  onChanged: (value) {}),
              ControlDropdown(
                  title: "축적바 위치",
                  titleTextStyle: controllerTitleText,
                  values: ["좌측 상단", "좌측 상단", "우측 하단", "우측 상단"],
                  onChanged: (value) {}),
              ControlDropdown(
                  title: "로고 위치",
                  titleTextStyle: controllerTitleText,
                  values: ["좌측 상단", "좌측 상단", "우측 하단", "우측 상단"],
                  onChanged: (value) {}),
            ]),
          ))
        ],
      );

  final controllerTitleText = const TextStyle(
      fontSize: 16,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.bold);
  final controllerValueText = const TextStyle(
      fontSize: 16,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal);
}
