import 'package:flutter/material.dart';
import 'package:qack/theme/theme.dart';

class InputDropdown<T> extends StatelessWidget {
  const InputDropdown({
    required this.items,
    required this.value,
    required this.labelText,
    super.key,
    this.onChanged,
    this.counterText = '',
    this.hintText,
    this.errorText,
    this.errorStyle,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.focusNode,
  });

  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final void Function(T?)? onChanged;

  final String labelText;
  final String? hintText;
  final String? counterText;
  final String? errorText;

  final TextStyle? errorStyle;

  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    const theme = LightTheme();
    final inputTextTheme = theme.inputTextThemeData;

    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<T>(
        items: items,
        value: value,
        focusNode: focusNode,
        elevation: 2,
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
          prefixIcon: prefixIcon != null
              ? IconTheme(
                  data: IconThemeData(color: inputTextTheme.iconColor),
                  child: prefixIcon!,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconTheme(
                  data: IconThemeData(color: inputTextTheme.iconColor),
                  child: suffixIcon!,
                )
              : null,
          prefixIconConstraints: prefixIconConstraints,
          suffixIconConstraints: suffixIconConstraints,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
