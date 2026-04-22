import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/features/home/presentation/widgets/specialty_card.dart';

class SpecialtySection extends StatelessWidget {
  const SpecialtySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        clipBehavior: Clip.none,
        itemCount: _specialties.length,
        separatorBuilder: (context, index) => const Gap(15),
        itemBuilder: (context, index) {
          final specialty = _specialties[index];
          return SpecialtyCard(
            title: specialty.title,
            imagePath: specialty.imagePath,
            bgColor: specialty.color,
          );
        },
      ),
    );
  }
}

class _Specialty {
  final String title;
  final String imagePath;
  final Color color;

  _Specialty({
    required this.title,
    required this.imagePath,
    required this.color,
  });
}

final List<_Specialty> _specialties = [
  _Specialty(
    title: "جراحة عامة",
    imagePath: AppImages.specialty1Svg,
    color: const Color(0xFF76B2F6),
  ),
  _Specialty(
    title: "دكتور قلب",
    imagePath: AppImages.specialty1Svg,
    color: const Color(0xFF58D3C5),
  ),
  _Specialty(
    title: "باطنة",
    imagePath: AppImages.specialty1Svg,
    color: const Color(0xFFF29B88),
  ),
  _Specialty(
    title: "أسنان",
    imagePath: AppImages.specialty1Svg,
    color: const Color(0xFF76B2F6),
  ),
  _Specialty(
    title: "أطفال",
    imagePath: AppImages.specialty1Svg,
    color: const Color(0xFF58D3C5),
  ),
];
