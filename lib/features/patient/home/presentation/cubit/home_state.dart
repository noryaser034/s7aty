part of 'home_cubit.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<DoctorModel> doctors;
  HomeSuccessState({required this.doctors});
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState({required this.error});
}
