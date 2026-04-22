import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigations.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/service/local/shared_pref.dart';
import 'package:se7ety/core/styles/text_styles.dart';
import 'package:se7ety/core/widgets/app_button.dart';
import 'package:se7ety/features/welcome/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:se7ety/features/welcome/on_boarding/presentation/widgets/onboarding_indicator.dart';
import 'package:se7ety/features/welcome/on_boarding/presentation/widgets/onboarding_page_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // PageView for Onboarding contents
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: cubit.totalPages,
                      onPageChanged: (index) {
                        cubit.onPageChanged(index);
                      },
                      itemBuilder: (context, index) {
                        final page = cubit.pages[index];
                        return OnboardingPageContent(page: page);
                      },
                    ),
                  ),
                  const Gap(20),
                  // Bottom Area: Indicator & Primary Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OnboardingIndicator(cubit: cubit),
                      AppButton(
                        text: cubit.isLastPage ? "هيا بنا !" : "التالي",
                        textStyle: TextStyles.w400s25.copyWith(
                          color: Colors.white,
                        ),
                        borderRadius: 20,
                        onPressed: () {
                          if (cubit.isLastPage) {
                            SharedPref.setOnboardingShown();
                            // Uncomment context.pushReplacement when builder for /login is ready.
                            // context.pushReplacement(AppRoutes.login);
                            pushAndClearStack(AppRoutes.welcome, context);
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
