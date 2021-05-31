class Validators {

  /// bắt lỗi trường email
  static String emailValidator(String value) {
    if (value.isEmpty || value == null) {
      return 'email không được để trống';
    }
    return null;
  }

  /// bắt lỗi trường user name
  static String nameValidator(String value) {
    if (value.isEmpty || value == null) {
      return 'userName không được để trống';
    }
    return null;
  }

  /// bắt lỗi trường password
  static String passValidator(String value) {
    if (value.isEmpty || value == null) {
      return 'password không được để trống';
    }
    return null;
  }

}
