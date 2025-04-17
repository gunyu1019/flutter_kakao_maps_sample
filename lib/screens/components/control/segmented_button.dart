import 'package:flutter/material.dart';

abstract class SegmentedButtonItem {
  abstract String text;
}

class ControlSegmentedButton<T> extends StatefulWidget {
  const ControlSegmentedButton(
      {super.key,
      required this.title,
      required this.values,
      required this.onChanged,
      this.titleTextStyle,
      this.initialValue});

  final String title;
  final TextStyle? titleTextStyle;

  final List<T> values;
  final T? initialValue;
  final void Function(T) onChanged;

  @override
  State<StatefulWidget> createState() => _ControlSegmentedButtonState();
}

class _ControlSegmentedButtonState<T extends SegmentedButtonItem> extends State<ControlSegmentedButton> {
  late T selectedButton;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedButton = widget.initialValue ?? widget.values[0];
    });
  }

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(widget.title,
              style: widget.titleTextStyle, textAlign: TextAlign.start),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SegmentedButton<T>(
            segments: widget.values.map((element) => ButtonSegment<T>(
                value: element,
                label: Text(element.text, overflow: TextOverflow.ellipsis),
              )).toList(),
            selected: <T>{selectedButton},
            onSelectionChanged: (Set<T> newSelection) {
              setState(() {
                // By default there is only a single segment that can be
                // selected at one time, so its value is always the first
                // item in the selected set.
                selectedButton = newSelection.first;
              });
            },
          )
        )
      ]);
}
