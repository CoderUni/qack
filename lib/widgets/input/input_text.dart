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
    this.suffix,
    this.suffixIcon,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
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
  final Widget? suffix;
  final Widget? suffixIcon;

  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

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
      cursorColor: inputTextTheme.cursorColor,
      decoration: InputDecoration(
        alignLabelWithHint: false,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: inputTextTheme.borderSideColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: inputTextTheme.focusedBorderSideColor,
            width: 1.5,
          ),
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
        prefixIcon: prefixIcon != null
            ? IconTheme(
                data: IconThemeData(color: inputTextTheme.iconColor),
                child: prefixIcon!,
              )
            : null,
        suffix: suffix,
        suffixIcon: suffixIcon != null
            ? IconTheme(
                data: IconThemeData(color: inputTextTheme.iconColor),
                child: suffixIcon!,
              )
            : null,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
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
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
