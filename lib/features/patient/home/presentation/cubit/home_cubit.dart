import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/features/auth/data/model/doctor_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  Future<void> getTopRatedDoctors() async {
    emit(HomeLoadingState());
    try {
      final snapshot = await FirebaseProvider.sortingDoctors();
      final doctors = snapshot.docs
          .map((e) => DoctorModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      emit(HomeSuccessState(doctors: doctors));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }
}
