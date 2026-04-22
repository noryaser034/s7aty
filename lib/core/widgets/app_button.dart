import 'package:flutter/material.dart';
import 'package:se7ety/core/styles/app_colors.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final bool isLoading;
  final bool isDisabled;
  final Widget? child;

  const AppButton({
    super.key,
    this.text,
    this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.borderRadius = 10,
    this.isLoading = false,
    this.isDisabled = false,
    this.child,
  }) : assert(text != null || child != null, 'Either text or child must be provided.');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0,
        ),
        onPressed: (isDisabled || isLoading) ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : (child ??
                Text(
                  text!,
                  style: textStyle ??
                      TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                )),
      ),
    );
  }
}
