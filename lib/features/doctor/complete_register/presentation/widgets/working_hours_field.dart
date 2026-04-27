import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/style/text_styles.dart';
import 'package:se7ety/core/widgets/custom_text_form_field.dart';
import 'package:se7ety/features/doctor/complete_register/presentation/cubit/complete_register_cubit.dart';

class WorkingHoursField extends StatelessWidget {
  const WorkingHoursField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompleteRegisterCubit>();
    return BlocBuilder<CompleteRegisterCubit, CompleteRegisterState>(
      buildWhen: (prev, curr) => curr is CompleteRegisterTimeUpdatedState,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ساعات العمل من', style: TextStyles.w400s15),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    hintTextText: cubit.formatTime(cubit.startTime),
                    prefixIcon: const Icon(Icons.access_time),
                    readOnly: true,
                    onTap: () => cubit.pickStartTime(context),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('إلى', style: TextStyles.w400s15),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    hintTextText: cubit.formatTime(cubit.endTime),
                    prefixIcon: const Icon(Icons.access_time),
                    readOnly: true,
                    onTap: () => cubit.pickEndTime(context),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
