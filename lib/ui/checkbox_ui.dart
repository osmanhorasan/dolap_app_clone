import 'package:flutter/material.dart';

class CheckboxUi extends StatefulWidget {
  const CheckboxUi({super.key});

  @override
  State<CheckboxUi> createState() => _CheckboxUiState();
}

class _CheckboxUiState extends State<CheckboxUi> {
  bool isChecked = false;
  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,

      WidgetState.focused,
      WidgetState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff08E1A1);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStateProperty.resolveWith(getColor),
      side: BorderSide(color: Color(0xff08E1A1), width: 2),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
