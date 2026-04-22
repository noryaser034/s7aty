import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';

class FirestoreProvider {
  static final doctorCollection = FirebaseFirestore.instance.collection(
    "doctors",
  );
  static final patientCollection = FirebaseFirestore.instance.collection(
    "patients",
  );

  static Future<void> addPatient(PatientModel patient) async {
    await patientCollection.doc(patient.uid).set(patient.toJson());
  }

  static Future<void> addDoctor(DoctorModel doctor) async {
    await doctorCollection.doc(doctor.uid).set(doctor.toJson());
  }
}
