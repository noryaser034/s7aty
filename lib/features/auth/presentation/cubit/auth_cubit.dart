import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/service/firebase/failuer/failuer.dart';
import 'package:se7ety/features/auth/data/models/auth_params.dart';
import 'package:se7ety/features/auth/data/repo/auth_repo.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> register(String user) async {
    emit(AuthLoadingState());
    var params = AuthParams(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    Either<Failuer, Unit> result;

    if (user == "مريض") {
      result = (await AuthRepo.registerPatient(params: params));
    } else {
      result = (await AuthRepo.registerDoctor(params: params));
    }
    result.fold(
      (failuer) => emit(
        AuthErrorState(message: failuer.message, errorMessage: failuer.message),
      ),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> login() async {
    emit(AuthLoadingState());

    var result = await AuthRepo.login(
      params: AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failuer) => emit(
        AuthErrorState(message: failuer.message, errorMessage: failuer.message),
      ),
      (r) => emit(AuthSuccessState()),
    );
  }
}
