import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/core/styles/text_styles.dart';
import 'package:se7ety/core/widgets/custom_text_form_field.dart';
import 'package:se7ety/features/home/presentation/widgets/doctor_card.dart';
import 'package:se7ety/features/home/presentation/widgets/specialty_section.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("صــحّـتـي", style: TextStyles.w700s25),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.notificationsIconSvg, height: 25),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("مرحبا,", style: TextStyles.w500s25),
              const Gap(10),
              Text(
                "احجز الآن وكن جزءًا من رحلتك الصحية.",
                style: TextStyles.w700s25,
              ),
              const Gap(20),
              CustomTextFormField(
                hintText: "ابحث عن طبيب أو تخصص",
                prefixIcon: const Icon(Icons.search),
              ),
              const Gap(20),
              Text(
                "التخصصات",
                style: TextStyles.w700s25.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const Gap(20),
              SpecialtySection(),
              const Gap(20),
              Text(
                "الاعلى تقييماً",
                style: TextStyles.w700s25.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(20),
              ListView.separated(
                itemBuilder: (context, index) {
                  return DoctorCard();
                },
                separatorBuilder: (context, index) => const Gap(15),
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
