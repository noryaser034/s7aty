import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class RigesterScreen extends StatelessWidget {
  const RigesterScreen({super.key, required this.user});
  final String user;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          log("success");
          pop(context);
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
        body: _registerBody(context),
        bottomNavigationBar: AuthFooter(
          text: "لديك حساب؟",
          textButton: "سجل دخول",
          onPressed: () {
            pushTo(AppRoutes.login, context, extra: user);
          },
        ),
      ),
    );
  }

  SingleChildScrollView _registerBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUnfocus,
          key: cubit.formKey,
          child: Column(
            children: [
              Image.asset(AppImages.logo, height: 250),
              Gap(20),
              Text(
                "أنشئ حساب الآن كـ \"$user\"",
                style: TextStyles.w700s25.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),

              Gap(20),
              CustomTextFormField(
                hintText: "اسم المستخدم",
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
                controller: cubit.nameController,
                validator: (p0) => AppValidators.name(
                  p0,
                  emptyMessage: "الاسم مطلوب",
                  invalidMessage: "الاسم غير صالح",
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
                  invalidMessage: "البريد الإلكتروني غير صالح",
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
              Gap(20),
              AppButton(
                text: "تسجيل حساب جديد",
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register(user);
                  }
                },
                width: double.infinity,
                borderRadius: 20,
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
