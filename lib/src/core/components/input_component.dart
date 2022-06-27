import 'package:flutter/material.dart';
import 'package:superapp/src/core/theme/app_fonts.dart';

class InputComponent extends StatelessWidget {
  const InputComponent({
    Key? key,
    required this.color,
    required this.label,
    required this.type,
    this.hint,
    this.focus,
    this.controller,
    this.validators,
  }) : super(key: key);

  final Color color;
  final String label;
  final String? hint;
  final FocusNode? focus;
  final TextInputType type;
  final TextEditingController? controller;
  final String? Function(String?)? validators;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppFonts.bodyLarge(),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      autofocus: true,
      focusNode: focus,
      keyboardType: type,
      validator: validators,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
