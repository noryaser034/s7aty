import 'package:flutter/material.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/features/welcome/on_boarding/presentation/cubit/on_boarding_cubit.dart';

class OnboardingIndicator extends StatelessWidget {
  final OnBoardingCubit cubit;

  const OnboardingIndicator({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        cubit.totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsetsDirectional.only(end: 5),
          height: 10,
          width: cubit.currentPage == index ? 30 : 10,
          decoration: BoxDecoration(
            color: cubit.currentPage == index
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
