import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_map_sdk_example/screens/components/title_component.dart';
import 'package:kakao_map_sdk_example/models/menu_info.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();

  static const MenuInfo menuInfo = MenuInfo("/navigation", "네비게이션 기능",
      "두 찍은 지점의 경로를 카카오네비 API로 탐색합니다..", FontAwesomeIcons.locationArrow, true);
}

class _NavigationMenuState extends State<NavigationMenu> {
  Widget _positionCardText(String title, String value) =>
      Text.rich(TextSpan(children: [
        TextSpan(text: title, style: positionTitleText),
        TextSpan(text: value, style: positionValueText)
      ]));

  Widget positionCard(String title, String value) => Expanded(
          child: InkWell(
        onTap: () {},
        child: Card(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Text(title, style: positionTitleText),
                _positionCardText("경도", "0.000"),
                _positionCardText("위도", "0.000")
              ],
            ),
          ),
        ),
      ));

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
          TitleComponent(
            title: NavigationMenu.menuInfo.title,
            backEnabled: true,
          ),
          Expanded(
              child: Row(
            children: [positionCard("출발지", ""), positionCard("목적지", "")],
          )),
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
