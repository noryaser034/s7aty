import 'package:flutter/material.dart';
import 'package:se7ety/core/style/colors.dart';
import 'package:se7ety/core/style/text_styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, required this.onSearch});
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: .1),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: TextFormField(
        readOnly: true,
        onTap: onSearch,
        textInputAction: TextInputAction.search,
        cursorColor: AppColors.primaryColor,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintStyle: TextStyles.w400s15,
          filled: true,
          hintText: 'ابحث عن دكتور',
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(17),
            ),
            child: IconButton(
              iconSize: 20,
              splashRadius: 20,
              color: AppColors.bgColor,
              icon: const Icon(Icons.search),
              onPressed: onSearch,
            ),
          ),
        ),
        style: TextStyles.w400s15,
      ),
    );
  }
}
