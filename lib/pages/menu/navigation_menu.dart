import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_map_sdk/kakao_map_sdk.dart';
import 'package:kakao_map_sdk_example/components/control/segmented_button.dart';
import 'package:kakao_map_sdk_example/components/control/slider.dart';
import 'package:kakao_map_sdk_example/components/title_component.dart';
import 'package:kakao_map_sdk_example/models/location_info.dart';
import 'package:kakao_map_sdk_example/models/menu_info.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();

  static const MenuInfo menuInfo = MenuInfo("/navigation", "네비게이션 기능",
      "두 찍은 지점의 경로를 카카오네비 API로 탐색합니다..", FontAwesomeIcons.locationArrow, true);
}

class _NavigationMenuState extends State<NavigationMenu>
    with TitleComponent {
  Widget title() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        children: [
          backButtom(),
          titleText(NavigationMenu.menuInfo.title),
        ],
      ));

  Widget _positionCardText(String title, String value) => Text.rich(
              TextSpan(children: [
                TextSpan(text: title, style: positionTitleText),
                TextSpan(text: value, style: positionValueText)
              ])
            );

  Widget positionCard(String title, String value) => Card(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Text(title, style: positionTitleText),
            _positionCardText("경도", "0.000"),
            _positionCardText("위도", "0.000")
          ],
        ),
      ),
    ),
  );

  Widget applyNavigationButton(String title, void Function() onPressed) =>
      OutlinedButton(
          onPressed: onPressed,
          child: SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: buttonText,
                textAlign: TextAlign.center,
              )));

  @override
  Widget build(BuildContext context) => Column(
        children: [
          title(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              positionCard("경도", "0"),
              positionCard("위도", "0"),
            ],
          ),
          applyNavigationButton("네비게이션 경로", () {})
        ],
      );

  final positionTitleText = const TextStyle(
      fontSize: 14,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.bold);
  final positionValueText = const TextStyle(
      fontSize: 14,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal);
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
  final buttonText = const TextStyle(
      fontSize: 16,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal);
}
