import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/style/colors.dart';
import 'package:se7ety/features/doctor/complete_register/presentation/cubit/complete_register_cubit.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompleteRegisterCubit>();
    return GestureDetector(
      onTap: () => cubit.pickImage(),
      child: BlocBuilder<CompleteRegisterCubit, CompleteRegisterState>(
        buildWhen: (prev, curr) => curr is CompleteRegisterImagePickedState,
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.accentColor,
                backgroundImage: cubit.profileImage != null
                    ? FileImage(File(cubit.profileImage!.path))
                    : null,
                child: cubit.profileImage == null
                    ? const Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.bgColor,
                      )
                    : null,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
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
          );
        },
      ),
    );
  }
}
