import 'package:flutter/material.dart';
import 'package:se7ety/core/style/text_styles.dart';
import 'package:se7ety/features/patient/home/data/card.dart';
import 'package:se7ety/features/patient/home/presentation/widgets/item_card_widget.dart';

class SpecialistsBanner extends StatelessWidget {
  const SpecialistsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("التخصصات", style: TextStyles.w500s20.copyWith(fontSize: 16)),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // pushTo(
                  //   context,
                  //   Routes.specializationSearch,
                  //   extra: cards[index].specialization,
                  // );
                },
                child: ItemCardWidget(model: cards[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
