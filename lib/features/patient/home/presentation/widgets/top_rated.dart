import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/widgets/doctor_card.dart';
import 'package:se7ety/features/patient/home/presentation/cubit/home_cubit.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.black12),
          );
        }
        if (state is HomeErrorState) {
          return Center(child: Text(state.error));
        }
        if (state is HomeSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.doctors.length,
            itemBuilder: (context, index) {
              return DoctorCard(doctor: state.doctors[index]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
