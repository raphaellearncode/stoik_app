import 'package:flutter/material.dart';

class SwitchBtn extends StatelessWidget {
  const SwitchBtn({
    Key? key,
    this.value,
    this.onChanged,
    required this.icon,
    this.align = Alignment.center,
  }) : super(key: key);

  final bool? value;
  final ValueChanged<bool>? onChanged;
  final IconData icon;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    var iconSize = 18.0; //SizeInfo.switchButtonIconSize;
    return IconButton(
        alignment: align,
        onPressed: () {
          onChanged!(value!);
        },
        splashRadius: 10,
        splashColor: Colors.transparent,
        icon: Icon(
          icon,
          size: iconSize,
          color: value == true
              ? Colors.amber //Theme.of(context).indicatorColor
              : Colors.grey.shade700, //Theme.of(context).unselectedWidgetColor,
        ));
  }
}
