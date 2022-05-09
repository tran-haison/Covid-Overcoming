import 'package:covid_overcoming/values/res/colors.dart';
import 'package:flutter/material.dart';

class CommonFilterChip extends StatefulWidget {
  const CommonFilterChip({
    Key? key,
    required this.label,
    this.onSelected,
  }) : super(key: key);

  final String label;
  final Function(bool)? onSelected;

  @override
  State<CommonFilterChip> createState() => _CommonFilterChipState();
}

class _CommonFilterChipState extends State<CommonFilterChip> {

  var selected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.label),
      selected: selected,
      onSelected: (value) {
        setState(() {
          selected = value;
        });
      },
      selectedColor: colorPrimary1,
      showCheckmark: false,
      backgroundColor: Colors.white,
      selectedShadowColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: const StadiumBorder(
        side: BorderSide(
          width: 1.2,
          color: colorLightGray1,
        ),
      ),
    );
  }
}
