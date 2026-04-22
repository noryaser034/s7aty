import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/functions/navigations.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/core/styles/text_styles.dart';
import 'package:se7ety/features/welcome/welcome/widgets/user_type_card.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.welcomeBg),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "اهلا بيك",
                    style: TextStyles.w700s56.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    "سجل واحجز عند دكتورك وانت فالبيت",
                    style: TextStyles.w500s20,
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor.withAlpha(80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "سجل دلوقتي كـ",
                            style: TextStyles.w500s20.copyWith(
                              color: AppColors.bgColor,
                            ),
                          ),
                          Gap(20),
                          UserTypeCard(
                            title: "دكتور",
                            onTap: () {
                              pushTo(
                                AppRoutes.register,
                                context,
                                extra: "دكتور",
                              );
                            },
                          ),
                          Gap(20),
                          UserTypeCard(
                            title: "مريض",
                            onTap: () {
                              pushTo(
                                AppRoutes.register,
                                context,
                                extra: "مريض",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
