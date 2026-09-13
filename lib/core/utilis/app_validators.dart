abstract class AppValidators {
  static String? validateUserName({String? name}) {
    if (name == null || name.trim().isEmpty) {
      return 'UserName is Required';
    }
    if (name.trim().length < 3) {
      return 'UserName must be at least 3 characters';
    }
    if (name.trim().length > 20) {
      return 'UserName must be under 20 Characters';
    }
    if (!RegExp(r'^[a-zA-Z0-0-9_]+$').hasMatch(name.trim())) {
      return 'Only letters,numbers and underscores allowed';
    }
    return null;
  }

  static String? validateEmail({String? email}) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword({String? password}) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Include at least one uppercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Include at least one number';
    }
    return null;
  }

  static String? validateConfirmPassword({
    String? confirmPassword,
    String? password,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhoneNumber({String? phone}) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number is required';
    }
    final cleaned = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    if (!RegExp(r'^\+?[1-9]\d{6,14}$').hasMatch(cleaned)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
