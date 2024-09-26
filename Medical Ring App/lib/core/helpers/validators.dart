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

}
