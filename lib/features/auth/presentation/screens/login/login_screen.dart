import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/functions/app_validators.dart';
import 'package:se7ety/core/functions/navigations.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/core/styles/text_styles.dart';
import 'package:se7ety/core/widgets/app_button.dart';
import 'package:se7ety/core/widgets/custom_text_form_field.dart';
import 'package:se7ety/core/widgets/dialogs.dart';
import 'package:se7ety/core/widgets/password_text_form_field.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_state.dart';
import 'package:se7ety/features/auth/presentation/widgets/auth_footer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.user});
  final String user;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          log("Login Success");
          pushAndClearStack(AppRoutes.patientMain, context);
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.errorMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              pushAndClearStack(AppRoutes.welcome, context);
            },
            icon: SvgPicture.asset(AppImages.backIconSvg, height: 20),
          ),
        ),
        body: _loginBody(context),
        bottomNavigationBar: AuthFooter(
          text: "ليس لديك حساب؟",
          textButton: "سجل الان",
          onPressed: () {
            pushTo(AppRoutes.register, context, extra: user);
          },
        ),
      ),
    );
  }

  SingleChildScrollView _loginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: cubit.formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            children: [
              Image.asset(AppImages.logo, height: 250),
              Gap(20),
              Text(
                "سجل دخول الان كـ “$user“ ",
                style: TextStyles.w700s25.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),

              Gap(20),

              CustomTextFormField(
                hintText: "nour@example.com",
                prefixIcon: const Icon(
                  Icons.email,
                  color: AppColors.primaryColor,
                ),
                controller: cubit.emailController,
                validator: (p0) => AppValidators.email(
                  p0,
                  emptyMessage: "البريد الإلكتروني مطلوب",
                  invalidMessage: "البريد الإلكتروني غير صحيح",
                ),
              ),
              Gap(20),
              PasswordTextFormField(
                hint: "***********",
                passwordController: cubit.passwordController,
                validator: AppValidators.password(
                  emptyMessage: "كلمة المرور مطلوبة",
                  invalidMessage: "كلمة المرور غير صالحة",
                ),
              ),
              Gap(10),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "نسيت كلمه السر؟",
                      style: TextStyles.w400s15.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(10),
              AppButton(
                text: "تسجيل الدخول",
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login();
                  }
                },
                width: double.infinity,
                borderRadius: 20,
                height: 60,
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Gap(10),
                  Text("أو"),
                  Gap(10),
                  Expanded(child: Divider()),
                ],
              ),
              Gap(20),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.darkColor),
                  ),
                  child: Text("Google"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
