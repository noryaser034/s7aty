bool isEmailValid(String email) {
  return RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(email);
}

bool isEgyptianPhone(String number) {
  return RegExp(r'^01[0125][0-9]{8}$').hasMatch(number);
}

String? validateSpecialty(String? value) {
  if (value == null || value.isEmpty) return 'اختر التخصص';
  return null;
}

String? validateBio(String? value) {
  if (value == null || value.trim().isEmpty) return 'أدخل نبذة تعريفية';
  if (value.trim().length < 20) return 'النبذة قصيرة جداً';
  return null;
}

String? validateClinicAddress(String? value) {
  if (value == null || value.trim().isEmpty) return 'أدخل عنوان العيادة';
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) return 'أدخل رقم الهاتف';
  if (!isEgyptianPhone(value.trim())) return 'رقم الهاتف غير صحيح';
  return null;
}

String? validateOptionalPhone(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  if (!isEgyptianPhone(value.trim())) return 'رقم الهاتف غير صحيح';
  return null;
}
