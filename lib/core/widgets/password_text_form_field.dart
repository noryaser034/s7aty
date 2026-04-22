import 'package:flutter/material.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/core/styles/text_styles.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.validator,
    this.hint,
    this.passwordController,
    this.prefixIcon,
  });

  final String? Function(String?)? validator;
  final String? hint;
  final TextEditingController? passwordController;
  final Widget? prefixIcon;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool ishide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: ishide,
      keyboardType: TextInputType.emailAddress,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        fillColor: AppColors.secondaryColor,
        filled: true,
        prefixIcon:
            widget.prefixIcon ??
            const Icon(Icons.lock, color: AppColors.primaryColor),
        suffixIcon: IconButton(
          icon: ishide
              ? const Icon(Icons.remove_red_eye, color: AppColors.primaryColor)
              : const Icon(Icons.visibility_off, color: AppColors.primaryColor),
          onPressed: () {
            setState(() {
              ishide = !ishide;
            });
          },
        ),
        hintText: widget.hint,
        hintStyle: TextStyles.w400s15.copyWith(color: AppColors.accentColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      validator: widget.validator,
      onChanged: (value) {},
    );
  }
}
