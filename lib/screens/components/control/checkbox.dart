import 'package:flutter/material.dart';

class ControlCheckbox extends StatefulWidget {
  const ControlCheckbox({
    super.key,
    required this.title,
    required this.onChanged,
    this.titleTextStyle,
    this.initialValue = false,
  });

  final String title;
  final TextStyle? titleTextStyle;

  final bool initialValue;
  final void Function(bool) onChanged;

  @override
  State<StatefulWidget> createState() => _CheckboxState();
}

class _CheckboxState extends State<ControlCheckbox> {
  bool selectedValue = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedValue = widget.initialValue;
    });
  }

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(widget.title, style: widget.titleTextStyle),
      Checkbox(value: selectedValue, onChanged: (value) {
        setState(() {
          selectedValue = value ?? false;
        });
        widget.onChanged(selectedValue);
      })
    ],
  );
}