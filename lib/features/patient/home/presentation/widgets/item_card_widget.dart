import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/style/colors.dart';
import 'package:se7ety/core/style/text_styles.dart';
import 'package:se7ety/core/widgets/custom_svg_picture.dart';
import 'package:se7ety/features/patient/home/data/card.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({super.key, required this.model});
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      margin: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
      decoration: BoxDecoration(
        color: model.cardBackground,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: model.cardLightColor.withValues(alpha: .8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: CircleAvatar(
                backgroundColor: model.cardLightColor,
                radius: 60,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomSvgPicture(path: AppImages.doctorCardSvg, width: 140),
                const Gap(10),
                Text(
                  model.specialization,
                  textAlign: TextAlign.center,
                  style: TextStyles.w500s20.copyWith(
                    color: AppColors.bgColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
