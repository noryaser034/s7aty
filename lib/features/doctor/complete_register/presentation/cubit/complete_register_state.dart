part of 'complete_register_cubit.dart';

class CompleteRegisterState {}

class CompleteRegisterInitialState extends CompleteRegisterState {}

class CompleteRegisterLoadingState extends CompleteRegisterState {}

class CompleteRegisterImagePickedState extends CompleteRegisterState {
  final File image;
  CompleteRegisterImagePickedState(this.image);
}

class CompleteRegisterTimeUpdatedState extends CompleteRegisterState {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  CompleteRegisterTimeUpdatedState({
    required this.startTime,
    required this.endTime,
  });
}

class CompleteRegisterSuccessState extends CompleteRegisterState {}

class CompleteRegisterErrorState extends CompleteRegisterState {
  final String error;
  CompleteRegisterErrorState({required this.error});
}
