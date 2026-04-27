import 'package:flutter/material.dart';
import 'package:se7ety/core/style/colors.dart';
import 'package:se7ety/core/style/text_styles.dart';
import 'package:se7ety/features/doctor/complete_register/data/model/specialities.dart';

class SpecialtyDropdown extends StatelessWidget {
  const SpecialtyDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  final String? value;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.primaryColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        filled: true,
        fillColor: AppColors.primaryColor.withValues(alpha: 0.1),
      ),
      hint: Text(
        'اختر التخصص',
        style: TextStyles.w400s15.copyWith(color: AppColors.accentColor),
        textDirection: TextDirection.rtl,
      ),
      items: specialities
          .map(
            (s) => DropdownMenuItem(
              value: s,
              child: Text(
                s,
                style: TextStyles.w400s15.copyWith(color: AppColors.darkColor),
                textDirection: TextDirection.rtl,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      validator: validator ?? (v) => v == null ? 'اختر التخصص' : null,
    );
  }
}
