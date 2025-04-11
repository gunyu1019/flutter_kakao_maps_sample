import 'package:flutter/material.dart';

class ControlSlider extends StatefulWidget {
  const ControlSlider(
      {super.key,
      required this.title,
      required this.onChanged,
      this.titleTextStyle,
      this.valueTextStyle,
      this.initialValue = 0,
      this.minValue = 0,
      this.maxValue = 0,
      this.placeholder = "",
      this.divisions});

  final String title;
  final TextStyle? titleTextStyle;
  final TextStyle? valueTextStyle;

  final String placeholder;

  final double initialValue;
  final double minValue;
  final double maxValue;
  final int? divisions;
  final void Function(double) onChanged;

  @override
  State<StatefulWidget> createState() => _SliderState();
}

class _SliderState extends State<ControlSlider> {
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      value = widget.initialValue;
    });
  }

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.title,
              style: widget.titleTextStyle, textAlign: TextAlign.start),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text("${value.toStringAsFixed(1)}${widget.placeholder}",
                  style: widget.valueTextStyle, textAlign: TextAlign.end))
        ]),
        Slider(
            value: value,
            min: widget.minValue,
            max: widget.maxValue,
            divisions: widget.divisions,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
              widget.onChanged(value);
            })
      ]);
}
