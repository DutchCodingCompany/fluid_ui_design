import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/debouncer.dart';

class SettingInputField extends StatefulWidget {
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
  State<SettingInputField> createState() => _SettingInputFieldState();
}

class _SettingInputFieldState extends State<SettingInputField> {
  late String value;

  late Debouncer debouncer;

  @override
  void initState() {
    super.initState();
    value = widget.value;
    debouncer = Debouncer(milliseconds: 500);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      keyboardType: widget.isDouble
          ? const TextInputType.numberWithOptions(decimal: true)
          : const TextInputType.numberWithOptions(),
      inputFormatters: widget.isDouble
          ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))]
          : null,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
      ),
      onChanged: (String? v) => debouncer.run(() => widget.onChanged(v!)),
    );
  }
}
