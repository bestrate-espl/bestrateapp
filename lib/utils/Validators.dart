class Validators {
  static String? validateFirstName(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter first name';
    }
    return null;
  }

  static String? validateLastName(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter last name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePhone(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter mobile no';
    }else if (value.length < 10){
      return 'Please enter valid mobile no';
    }
    return null;
  }

  static String? validatePin(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter pin code';
    }else if (value.length < 6){
      return 'Please enter valid pin code';
    }
    return null;
  }

  static String? validateBusinessName(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter business name';
    }
    return null;
  }

  static String? validateGSTIN(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter GSTIN';
    }else if (value.length < 15){
      return 'Please enter valid GSTIN No.';
    }
    return null;
  }

  static String? validateBusinessPin(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter business pin code';
    }else if (value.length < 6){
      return 'Please enter valid business pin code';
    }
    return null;
  }

  static String? validateProductName(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter your product name';
    }
    return null;
  }


  static String? validateDescription(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter your description';
    }
    return null;
  }

  static String? validateBudget(String? value){
    if (value == null || value.isEmpty){
      return 'Please enter your budget';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}