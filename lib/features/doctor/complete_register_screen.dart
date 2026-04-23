import 'package:flutter/material.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/core/styles/text_styles.dart';
import 'package:se7ety/core/widgets/app_button.dart';
import 'package:se7ety/core/widgets/custom_text_form_field.dart';

class CompleteRegisterScreen extends StatelessWidget {
  const CompleteRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إكمال عملية التسجيل',
          style: TextStyles.w500s20.copyWith(color: AppColors.bgColor),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.accentColor,
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: AppColors.bgColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text('التخصص', style: TextStyles.w400s15),
            ),
            const SizedBox(height: 8),
            const CustomTextFormField(hintText: 'دكتور عظام'),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('نبذة تعريفية', style: TextStyles.w400s15),
            ),
            const SizedBox(height: 8),
            const CustomTextFormField(hintText: 'سجل الوصف الوظيفي الخاص بك'),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('عنوان العيادة', style: TextStyles.w400s15),
            ),
            const SizedBox(height: 8),
            const CustomTextFormField(hintText: '5 شارع مصدق - الدقي - الجيزة'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('ساعات العمل من', style: TextStyles.w400s15),
                      SizedBox(height: 8),
                      CustomTextFormField(
                        hintText: 'AM 10:00',
                        prefixIcon: Icon(Icons.access_time),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('إلى', style: TextStyles.w400s15),
                      SizedBox(height: 8),
                      CustomTextFormField(
                        hintText: 'PM 10:00',
                        prefixIcon: Icon(Icons.access_time),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('رقم الهاتف 1', style: TextStyles.w400s15),
            ),
            const SizedBox(height: 8),
            const CustomTextFormField(
              hintText: '20xxxxxxxxx+',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('رقم الواتس (اختياري)', style: TextStyles.w400s15),
            ),
            const SizedBox(height: 8),
            const CustomTextFormField(
              hintText: '20xxxxxxxxx+',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            AppButton(text: 'التسجيل', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}