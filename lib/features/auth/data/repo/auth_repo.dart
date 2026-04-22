import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ety/core/service/firebase/failuer/failuer.dart';
import 'package:se7ety/core/service/firebase/firestore_provider.dart';
import 'package:se7ety/core/service/local/shared_pref.dart';
import 'package:se7ety/features/auth/data/models/auth_params.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';

abstract class AuthRepo {
  static Future<Either<Failuer, String>> login({
    required AuthParams params,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      await SharedPref.cacheUserId(credential.user?.uid ?? '');

      if (credential.user?.photoURL == "patient") {
        return const Right("مريض");
      } else if (credential.user?.photoURL == "doctor") {
        return const Right("طبيب");
      }
      return Left(Failuer(message: 'مستخدم غير معروف'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Failuer(message: 'كلمه المرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        return Left(
          Failuer(message: 'الحساب موجود بالفعل لهذا البريد الإلكتروني'),
        );
      } else {
        return Left(Failuer(message: 'حدث خطأ غير متوقع'));
      }
    } catch (e) {
      return Left(Failuer(message: 'حدث خطأ غير متوقع'));
    }
  }

  static Future<Either<Failuer, Unit>> registerPatient({
    required AuthParams params,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      await credential.user?.updateDisplayName(params.name);
      await credential.user?.updatePhotoURL("patient");
      await SharedPref.cacheUserId(credential.user?.uid ?? '');

      var patientData = PatientModel(
        name: params.name,
        email: params.email,
        uid: credential.user?.uid,
      );
      await FirestoreProvider.addPatient(patientData);

      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Failuer(message: 'كلمه المرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        return Left(
          Failuer(message: 'الحساب موجود بالفعل لهذا البريد الإلكتروني'),
        );
      } else {
        return Left(Failuer(message: 'حدث خطأ غير متوقع'));
      }
    } catch (e) {
      return Left(Failuer(message: 'حدث خطأ غير متوقع'));
    }
  }

  static Future<Either<Failuer, Unit>> registerDoctor({
    required AuthParams params,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      await credential.user?.updateDisplayName(params.name);
      await credential.user?.updatePhotoURL("doctor");
      await SharedPref.cacheUserId(credential.user?.uid ?? '');
      var doctorDate = DoctorModel(
        name: params.name,
        email: params.email,
        uid: credential.user?.uid,
      );
      await FirestoreProvider.addDoctor(doctorDate);
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Failuer(message: 'كلمه المرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        return Left(
          Failuer(message: 'الحساب موجود بالفعل لهذا البريد الإلكتروني'),
        );
      } else {
        return Left(Failuer(message: 'حدث خطأ غير متوقع'));
      }
    } catch (e) {
      return Left(Failuer(message: 'حدث خطأ غير متوقع'));
    }
  }
}
