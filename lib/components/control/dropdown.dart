import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ControlDropdown extends StatefulWidget {
  const ControlDropdown({
    super.key,
    required this.title,
    required this.values,
    required this.onChanged,
    this.titleTextStyle,
    this.initialValue = 0,
  });

  final String title;
  final TextStyle? titleTextStyle;

  final List<String> values;
  final int initialValue;
  final void Function(int) onChanged;

  @override
  State<StatefulWidget> createState() => _DropdownState();
}

class _DropdownState extends State<ControlDropdown> {
  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedValue = widget.initialValue;
    });
  }

  Widget dropdown() => DropdownButton(
    isExpanded: true,
    value: selectedValue,
    items: widget.values
      .mapIndexed((index, element) => DropdownMenuItem(
        value: index,
        child: Text(element),
      )).toList(),
    onChanged: (value) {
      widget.onChanged(value!);
      setState(() {
        selectedValue = value;
      });
    },
  );

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: widget.titleTextStyle, textAlign: TextAlign.start),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          width: double.infinity,
          child: dropdown()
        )
      ],
    );
}