import 'package:flutter/material.dart';
import 'package:spotify/core/config/theme/app_colors.dart';

class CustomFormField extends StatelessWidget {
  var controller = TextEditingController();
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Function(String?)? onChang;
  final Function()? onTap;
  final Function(PointerDownEvent)? onTapOutside;
  final Color backgroundColor;
  final FocusNode? focusNode;
  final double borderRadius;

  CustomFormField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.labelText = '',
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.prefix,
    this.focusNode,
    this.maxLines = 1,
    this.validator,
    this.onChang,
    this.onTap,
    this.backgroundColor = AppColors.white,
    this.onTapOutside,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      validator: validator,
      maxLines: maxLines,
      onChanged: onChang,
      focusNode: focusNode,
      controller: controller,
      onTap: onTap,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.labelSmall,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        fillColor: backgroundColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: AppColors.grey.withOpacity(.3), width: 2),
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
    );
  }
}
