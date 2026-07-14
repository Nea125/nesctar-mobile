class Validator {
  Validator._();
  static const Pattern _pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String? validationEmail(String? value) {
    // RegExp regex = RegExp(_pattern as String);
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (value!.trim().isEmpty) {
      return 'Email is required.';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Email is not correct format';
    }
    return null;
  }

  static String? validationPassword(String? value) {
    if (value == '') {
      return 'password is required.';
    }
    return null;
  }

  static String? validationFirstName(String? value) {
    if (value!.trim().isEmpty) {
      return 'First name is required.';
    }
    return null;
  }

  static String? validationLastName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Last name is required.';
    }
    return null;
  }

  static String? validationFullName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Full name is required.';
    }
    return null;
  }

  static String? validationMassage(String? value) {
    if (value!.trim().isEmpty) {
      return 'Massage is required.';
    }
    return null;
  }

  static String? validationCode(String? value) {
    if (value!.trim().isEmpty) {
      return 'Code is required';
    }
    return null;
  }

  static String? validationPhoneNum(String? value) {
    if (value!.trim().isEmpty) {
      return 'Phone Number is required.';
    }
    return null;
  }

  static String? validatePassword(bool? isPassword, String? value,
      String? otherPassword, bool? isNewPassword) {
    if (value == '') {
      if (isNewPassword == true) {
        return isPassword == true
            ? "Please input your new password"
            : "Please input your confirm new password";
      }
      return isPassword == true
          ? "Please input your password"
          : 'Please input your confirm password';
    }

    if (isPassword == true && (value?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters';
    }

    if (isNewPassword == true &&
        isPassword == false &&
        value != otherPassword) {
      return 'New password and confirm new password do not match';
    }

    if (isPassword == false && value != otherPassword) {
      return 'Password and confirm password do not match';
    }

    return null;
  }
}
