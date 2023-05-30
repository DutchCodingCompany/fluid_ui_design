import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingInputField extends StatelessWidget {
  const SettingInputField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.value,
    this.isDouble = true,
  });

  // Label Text
  final String labelText;

  final void Function(String value) onChanged;
  final bool isDouble;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      keyboardType:
          isDouble ? const TextInputType.numberWithOptions(decimal: true) : const TextInputType.numberWithOptions(),
      inputFormatters:
          isDouble ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))] : null,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
      ),
      onChanged: onChanged,
    );
  }
}
