import 'package:kakao_map_sdk/kakao_map_sdk.dart';
import 'package:kakao_map_sdk_example/components/control/segmented_button.dart';

class LocationInfo extends SegmentedButtonItem {
  @override
  String text;

  final LatLng? position;

  LocationInfo(this.text, [this.position]);
}
