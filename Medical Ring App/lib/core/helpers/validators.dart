class Validators {



  // Validate email text field
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regular expression for validating an email
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Validate is there text in the text field
  static String? validateText(String? value) {
    print('validateText is $value');
    if (value == null || value.isEmpty) {
      print('Text field cannot be empty');
      return 'Text field cannot be empty';
    }
    return null;
  }

  // Validate name text field
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Validate phone number text field
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // Regular expression for validating a phone number
    final RegExp phoneRegExp = RegExp(
      r'^[0-9]{10}$',
    );
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
