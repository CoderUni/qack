import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qack/theme/theme.dart';

class InputText extends StatelessWidget {
  const InputText({
    required this.maxLength,
    required this.labelText,
    super.key,
    this.controller,
    this.onChanged,
    this.minLines,
    this.maxLines = 1,
    this.obscureText = false,
    this.counterText = '',
    this.hintText,
    this.errorText,
    this.errorStyle,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.validator,
  });

  final TextEditingController? controller;
  final dynamic Function(String)? onChanged;

  final int? minLines;
  final int? maxLines;
  final int maxLength;

  final bool obscureText;

  final String labelText;
  final String? hintText;
  final String? counterText;
  final String? errorText;

  final TextStyle? errorStyle;

  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final FocusNode? focusNode;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    final inputTextTheme = theme.inputTextThemeData;

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      focusNode: focusNode,
      style: AppTextStyle.textMD.regular.copyWith(color: theme.textColor1),
      decoration: InputDecoration(
        alignLabelWithHint: false,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: inputTextTheme.borderSideColor),
        ),
        counterText: counterText,
        labelText: labelText,
        hintText: hintText,
        hintStyle:
            AppTextStyle.textMD.regular.copyWith(color: theme.textColor3),
        errorText: errorText,
        errorStyle: AppTextStyle.textMD.regular
            .copyWith(color: inputTextTheme.errorColor),
        labelStyle:
            AppTextStyle.textMD.regular.copyWith(color: theme.textColor2),
        prefix: prefix,
        prefixIcon: IconTheme(
          data: IconThemeData(color: inputTextTheme.iconColor),
          child: prefixIcon ?? const SizedBox(),
        ),
        suffixIcon: suffixIcon,
      ),
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '$labelText can not be empty';
            }
            return null;
          },
    );
  }
}
