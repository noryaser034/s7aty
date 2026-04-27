import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/functions/validations.dart';
import 'package:se7ety/core/routes/navigations.dart';
import 'package:se7ety/core/style/colors.dart';
import 'package:se7ety/core/style/text_styles.dart';
import 'package:se7ety/core/widgets/custom_text_form_field.dart';
import 'package:se7ety/core/widgets/dialogs.dart';
import 'package:se7ety/core/widgets/main_button.dart';
import 'package:se7ety/features/doctor/complete_register/presentation/cubit/complete_register_cubit.dart';
import 'package:se7ety/features/doctor/complete_register/presentation/widgets/field_labels.dart';
import 'package:se7ety/features/doctor/complete_register/presentation/widgets/profile_image_picker.dart';
import 'package:se7ety/features/doctor/complete_register/presentation/widgets/speciality_dropdown.dart';
import 'package:se7ety/features/doctor/complete_register/presentation/widgets/working_hours_field.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({super.key});

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompleteRegisterCubit>();
    return BlocListener<CompleteRegisterCubit, CompleteRegisterState>(
      listener: (context, state) {
        if (state is CompleteRegisterLoadingState) {
          showLoadingDialog(context);
        }
        if (state is CompleteRegisterSuccessState) {
          pop(context);
          log('success');
        }
        if (state is CompleteRegisterErrorState) {
          pop(context);
          showMyDialog(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إكمال عملية التسجيل',
            style: TextStyles.w500s20.copyWith(color: AppColors.bgColor),
          ),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
        ),
        body: Form(
          key: cubit.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const ProfileImagePicker(),
                const SizedBox(height: 20),
                FieldLabel('التخصص'),
                const SizedBox(height: 8),
                SpecialtyDropdown(
                  value: cubit.selectedSpecialty,
                  onChanged: (val) =>
                      setState(() => cubit.selectedSpecialty = val),
                  validator: validateSpecialty,
                ),
                const SizedBox(height: 16),
                FieldLabel('نبذة تعريفية'),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: cubit.bioController,
                  hintTextText: 'سجل الوصف الوظيفي الخاص بك',
                  maxLines: 6,
                  validator: validateBio,
                ),
                const SizedBox(height: 16),
                FieldLabel('عنوان العيادة'),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: cubit.clinicAddressController,
                  hintTextText: '5 شارع مصدق - الدقي - الجيزة',
                  validator: validateClinicAddress,
                ),
                const SizedBox(height: 16),
                const WorkingHoursField(),
                const SizedBox(height: 16),
                FieldLabel('رقم الهاتف 1'),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: cubit.phone1Controller,
                  hintTextText: '20xxxxxxxxx+',
                  keyboardType: TextInputType.phone,
                  validator: validatePhone,
                  inputFormatter: [LengthLimitingTextInputFormatter(11)],
                ),
                const SizedBox(height: 16),
                FieldLabel('رقم الواتس (اختياري)'),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: cubit.phone2Controller,
                  hintTextText: '20xxxxxxxxx+',
                  keyboardType: TextInputType.phone,
                  validator: validateOptionalPhone,
                  inputFormatter: [LengthLimitingTextInputFormatter(11)],
                ),
                const SizedBox(height: 24),
                MainButton(
                  text: 'التسجيل',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      if (cubit.profileImage != null) {
                        cubit.updateDoctorProfile();
                      } else {
                        showMyDialog(
                          context,
                          'من فضلك قم بتحديث الصورة الشخصية',
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
