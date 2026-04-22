import 'package:flutter/material.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/core/styles/text_styles.dart';

class UserTypeCard extends StatelessWidget {
  const UserTypeCard({super.key, this.onTap, required this.title});
  final Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.bgColor.withAlpha(90),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            title,
            style: TextStyles.w700s25,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
