import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    this.maxLines,
    this.border,
    this.label,
    this.height,
    this.validator,
  });
  final TextEditingController controller;
  final Widget? hint;
  final Widget? prefixIcon;
  final int? maxLines;
  final InputBorder? border;
  final Widget? label;
  final double? height;
  final String? Function(String?)? validator;
  // final
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        validator: validator,
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
          label: label,

          prefixIcon: prefixIcon,
          border: border ?? InputBorder.none,
          hint: hint,
        ),
      ),
    );
  }
}
