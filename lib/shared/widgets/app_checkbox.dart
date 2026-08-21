import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final bool hasError;

  const AppCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: hasError ? BorderSide(color: Colors.red, width: 2) : null,
      value: value,
      onChanged: onChanged,
    );
  }
}
