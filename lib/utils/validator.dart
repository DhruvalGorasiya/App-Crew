import 'package:app_crew/exports/exports.dart';

FormFieldValidator emailValidator(BuildContext context) {
  return (value) {
    if (value!.isEmpty) {
      // context.read<AuthVM>().setEmailError(true);
      return "Please enter email address";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      // context.read<AuthVM>().setEmailError(true);
      return "Please enter a valid email address";
    }
    // context.read<AuthVM>().setEmailError(false);

    return null;
  };
}

FormFieldValidator passwordValidation() {
  return (value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Password";
    }

    // Check for at least one symbol
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return "Password must contain at least one symbol";
    // }

    // Check for at least one capital letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one capital letter';
    }

    // Check for at least one number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }

    // Check for length
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }

    return null;
  };
}

String? confirmPasswordValidation({required String passValue, required String? value}) {
  debugPrint("confirmPasswordValidation passValue -====>> $passValue");
  debugPrint("confirmPasswordValidation value -====>> $value");

  if (value == null || value.isEmpty) {
    return "Please Confirm Enter Password";
  }

  // Check for at least one symbol
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return "Password must contain at least one symbol";
  }

  // Check for at least one capital letter
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one capital letter';
  }

  // Check for at least one number
  if (!value.contains(RegExp(r'[0-9]'))) {
    return "Password must contain at least one number";
  }

  // Check for length
  if (value.length < 8) {
    return "Password must be at least 8 characters long";
  }

  if (value != passValue) {
    return "Password and Confirm Password not match";
  }

  return null;
}

FormFieldValidator commonValidator({required String title, bool? isForDropDown}) {
  return (value) {
    String valueN = (value ?? "").toString().trim();
    if (valueN != "") {
      return null;
    }
    return "Please ${isForDropDown == true ? "Select" : "Enter"} $title";
  };
}
