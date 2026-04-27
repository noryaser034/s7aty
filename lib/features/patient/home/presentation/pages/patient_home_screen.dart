import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/core/style/colors.dart';
import 'package:se7ety/core/style/text_styles.dart';
import 'package:se7ety/features/patient/home/presentation/widgets/home_search_bar.dart';
import 'package:se7ety/features/patient/home/presentation/widgets/specialists_widget.dart';
import 'package:se7ety/features/patient/home/presentation/widgets/top_rated.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key, required this.onSearch});
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseProvider.currentUser;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              splashRadius: 20,
              icon: const Icon(
                Icons.notifications_active,
                color: AppColors.darkColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: Text(
          'صــــــحّـتــي',
          style: TextStyles.w500s20.copyWith(color: AppColors.darkColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'مرحبا، ',
                      style: TextStyles.w400s15.copyWith(fontSize: 18),
                    ),
                    TextSpan(
                      text: currentUser?.displayName,
                      style: TextStyles.w500s20.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                "احجز الآن وكن جزءًا من رحلتك الصحية.",
                style: TextStyles.w500s20.copyWith(
                  color: AppColors.darkColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),
              HomeSearchBar(onSearch: onSearch),
              const SizedBox(height: 20),
              const SpecialistsBanner(),
              const SizedBox(height: 10),
              Text(
                "الأعلي تقييماً",
                textAlign: TextAlign.center,
                style: TextStyles.w500s20.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const TopRatedList(),
            ],
          ),
        ),
      ),
    );
  }
}
