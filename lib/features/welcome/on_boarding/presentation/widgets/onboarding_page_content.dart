import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/core/styles/text_styles.dart';
import 'package:se7ety/features/welcome/on_boarding/data/models/on_boarding_model.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnBoardingModel page;

  const OnboardingPageContent({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(page.image, height: 300),
        const Gap(30),
        Text(
          page.title,
          textAlign: TextAlign.center,
          style: TextStyles.w500s25.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(15),
        Text(
          page.body,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: AppColors.borderColor),
        ),
      ],
    );
  }
}
