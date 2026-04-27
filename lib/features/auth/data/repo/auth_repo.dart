import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ety/core/constants/user_type_enum.dart';
import 'package:se7ety/core/functions/image_uploader.dart';
import 'package:se7ety/core/services/firebase/failure/failure.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';
import 'package:se7ety/features/auth/data/model/auth_params.dart';
import 'package:se7ety/features/auth/data/model/doctor_model.dart';
import 'package:se7ety/features/auth/data/model/patient_model.dart';

class AuthRepo {
  static Future<Either<Failure, UserTypeEnum>> login(AuthParams params) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      //caching user id
      User? user = credential.user;

      await SharedPref.cahceUserID(user?.uid ?? '');
      if (UserTypeEnum.fromString(user?.photoURL ?? '') ==
          UserTypeEnum.doctor) {
        return right(UserTypeEnum.doctor);
      } else {
        return right(UserTypeEnum.patient);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(Failure(message: 'كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        return left(Failure(message: 'الحساب موجود بالفعل'));
      } else {
        return left(Failure(message: 'حدث خطأ'));
      }
    } catch (e) {
      return left(Failure(message: 'حدث خطا'));
    }
  }

  static Future<Either<Failure, Unit>> registerDoctor(AuthParams params) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      User? user = credential.user;
      await user?.updateDisplayName(params.name);
      //use photourl as role
      await user?.updatePhotoURL(UserTypeEnum.doctor.value);
      //caching user id
      await SharedPref.cahceUserID(user?.uid ?? '');

      // add user to firestore
      var doctorData = DoctorModel(
        name: params.name,
        email: params.email,
        uid: credential.user?.uid,
      );
      await FirebaseProvider.addDoctor(doctorData);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(Failure(message: 'كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        return left(Failure(message: 'الحساب موجود بالفعل'));
      } else {
        return left(Failure(message: 'حدث خطأ'));
      }
    } catch (e) {
      return left(Failure(message: 'حدث خطا'));
    }
  }

  static Future<Either<Failure, Unit>> registerPatient(
    AuthParams params,
  ) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      User? user = credential.user;
      await user?.updateDisplayName(params.name);

      // Using photoUrl As Role
      await user?.updatePhotoURL(UserTypeEnum.patient.value);
      //caching user id
      await SharedPref.cahceUserID(user?.uid ?? '');

      // add User To firestore
      var patientData = PatientModel(
        name: params.name,
        email: params.email,
        uid: credential.user?.uid,
      );

      await FirebaseProvider.addPatient(patientData);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(Failure(message: 'كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        return left(Failure(message: 'الحساب موجود بالفعل'));
      } else {
        return left(Failure(message: 'حدث خطأ'));
      }
    } catch (e) {
      return left(Failure(message: 'حدث خطا'));
    }
  }

  static Future<Either<Failure, Unit>> updateDoctorProfile(
    DoctorModel doctor,
  ) async {
    try {
      doctor.imageUrl = await uploadImageToCloudinary(doctor.image!) ?? '';
      await FirebaseProvider.updateDoctor(doctor);
      return right(unit);
    } catch (e) {
      return left(Failure(message: 'حدث خطأ'));
    }
  }
}
