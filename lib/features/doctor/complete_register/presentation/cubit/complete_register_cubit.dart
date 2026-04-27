import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ety/features/auth/data/model/doctor_model.dart';
import 'package:se7ety/features/auth/data/repo/auth_repo.dart';
part 'complete_register_state.dart';

class CompleteRegisterCubit extends Cubit<CompleteRegisterState> {
  CompleteRegisterCubit() : super(CompleteRegisterInitialState());

  final formKey = GlobalKey<FormState>();
  final bioController = TextEditingController();
  final clinicAddressController = TextEditingController();
  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();
  String? selectedSpecialty;

  File? profileImage;
  TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 22, minute: 0);

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      profileImage = File(picked.path);
      emit(CompleteRegisterImagePickedState(profileImage!));
    }
  }

  Future<void> pickStartTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (picked != null) {
      startTime = picked;
      emit(
        CompleteRegisterTimeUpdatedState(
          startTime: startTime,
          endTime: endTime,
        ),
      );
    }
  }

  Future<void> pickEndTime(BuildContext context) async {
    final picked = await showTimePicker(context: context, initialTime: endTime);
    if (picked != null) {
      endTime = picked;
      emit(
        CompleteRegisterTimeUpdatedState(
          startTime: startTime,
          endTime: endTime,
        ),
      );
    }
  }

  String formatTime(TimeOfDay t) {
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final minute = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$period $hour:$minute';
  }

  Future<void> updateDoctorProfile() async {
    emit(CompleteRegisterLoadingState());
    final doctor = DoctorModel(
      uid: FirebaseAuth.instance.currentUser!.uid,
      bio: bioController.text,
      phone1: phone1Controller.text,
      phone2: phone2Controller.text,
      openHour: formatTime(startTime),
      closeHour: formatTime(endTime),
      address: clinicAddressController.text,
      specialization: selectedSpecialty,
      image: profileImage,
    );
    var data = await AuthRepo.updateDoctorProfile(doctor);
    data.fold(
      (failure) => emit(CompleteRegisterErrorState(error: failure.message)),
      (r) => emit(CompleteRegisterSuccessState()),
    );
  }

  @override
  Future<void> close() async {
    bioController.dispose();
    clinicAddressController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    super.close();
  }
}
