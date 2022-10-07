class FormValidator {
  String? validateEmail(String email) {
    String? validation;
    validation = checkEmpty(fieldName: 'Email', fieldValue: email);
    return validation;
  }

  // Util Validators
  checkEmpty({required String fieldName, required String fieldValue}) {
    if (fieldValue.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }
}
