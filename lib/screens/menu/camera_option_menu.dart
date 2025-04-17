import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_map_sdk/kakao_map_sdk.dart';
import 'package:kakao_map_sdk_example/screens/components/control/segmented_button.dart';
import 'package:kakao_map_sdk_example/screens/components/control/slider.dart';
import 'package:kakao_map_sdk_example/screens/components/title_component.dart';
import 'package:kakao_map_sdk_example/models/location_info.dart';
import 'package:kakao_map_sdk_example/models/menu_info.dart';

class CameraOptionMenu extends StatefulWidget {
  const CameraOptionMenu({super.key});

  @override
  State<CameraOptionMenu> createState() => _CameraOptionMenuState();

  static const MenuInfo menuInfo = MenuInfo("/camera", "카메라 기능",
      "지도를 비추고 있는 카메라를 조작합니다.", FontAwesomeIcons.camera, true);
}

class _CameraOptionMenuState extends State<CameraOptionMenu> {
  Widget _positionInfoText(String title, String data) => Row(
        spacing: 2,
        children: [
          Text(title, style: positionTitleText),
          Flexible(
              child: Text(
            data,
            style: positionValueText,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      );

  Widget positionInfoText() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 1.0,
        children: [
          _positionInfoText("경도: ", "1234512345123451234512345"),
          _positionInfoText("위도: ", "12345"),
        ]);
  }

  Widget positionInfoCard(String title, String data) {
    return Card(
        child: Container(
      constraints: const BoxConstraints(minHeight: 60, minWidth: 60),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 1,
          children: [
            Text(title, style: positionTitleText),
            Text(data, style: positionValueText, overflow: TextOverflow.fade)
          ]),
    ));
  }

  Widget cameraInfoText() {
    return Row(children: [
      Expanded(flex: 2, child: positionInfoText()),
      Expanded(flex: 1, child: positionInfoCard("기울기", "0도")),
      Expanded(flex: 1, child: positionInfoCard("틸트", "0도")),
      Expanded(flex: 1, child: positionInfoCard("높이", "0m")),
    ]);
  }

  Widget applyCameraButton(String title, void Function() onPressed) =>
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
            title: CameraOptionMenu.menuInfo.title,
            backEnabled: false,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(spacing: 2, children: [
              cameraInfoText(),
              ControlSegmentedButton(
                  title: "위치",
                  titleTextStyle: controllerTitleText,
                  values: [
                    LocationInfo("내 위치"),
                    LocationInfo("카카오 판교캠퍼스",
                        const LatLng(37.39479412020964, 127.11116968185037)),
                    LocationInfo("서울시청",
                        const LatLng(37.56664910407437, 126.97822134589721)),
                    LocationInfo("강원대학교",
                        const LatLng(37.86921611369963, 127.74240558283384)),
                  ],
                  onChanged: (index) {}),
              ControlSlider(
                  title: "애니메이션",
                  titleTextStyle: controllerTitleText,
                  valueTextStyle: controllerValueText,
                  onChanged: (value) {},
                  placeholder: "초",
                  divisions: 120,
                  maxValue: 60.0),
              ControlSlider(
                  title: "기울기",
                  titleTextStyle: controllerTitleText,
                  valueTextStyle: controllerValueText,
                  onChanged: (value) {},
                  placeholder: "도",
                  divisions: 360,
                  maxValue: 360.0),
              ControlSlider(
                  title: "틸트",
                  titleTextStyle: controllerTitleText,
                  valueTextStyle: controllerValueText,
                  onChanged: (value) {},
                  placeholder: "도",
                  divisions: 90,
                  maxValue: 90.0),
              applyCameraButton("적용", () {})
            ]),
          ))
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
