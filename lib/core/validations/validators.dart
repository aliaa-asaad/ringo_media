mixin Validations {
  String? isValidEmail(String? email) {
    if (email!.isEmpty) {
      return "الرجاء ادخال البريد الألكتروني بشكل صحيح";
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "الرجاء ادخال البريد الألكتروني";
    }
    return null;
  }

  String? isValidContent(String? content) {
    if (content!.isEmpty) {
      return '';
    }
    return null;
  }

  String? isValidPassword(String? password) {
    if (password!.isEmpty) {
      return '';
    }
    //capital letter
    /* else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(password)) {
      return "كلمة المرور يجب ان تحتوي على حرف كبير واحد على الأقل";
    } else if (password.length < 8) {
      return "كلمة المرور يجب ان تكون اكثر من 8 احرف";
    } */
    return null;
  }

  String? isValidId(String? id) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (id!.isEmpty) {
      return "الرجاء ادخال رقم الهوية";
    } else if (id.length < 11) {
      return "رقم الهوية يجب ان يتكون من 14 رقم";
    }
    return null;
  }

  /*  String? isValidPhone(String? phone) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (phone!.isEmpty) {
      return "الرجاء ادخال رقم الجوال";
    } else if (SharedHandler.instance!.getData(
                key: SharedKeys().countryType, valueType: ValueType.int) ==
            1 &&
        phone.length < 11) {
      return "رقم الجوال يجب ان يتكون من 11 رقم";
    }
    else if (SharedHandler.instance!.getData(
                key: SharedKeys().countryType, valueType: ValueType.int) ==
            0 &&
        phone.length < 14){
      return "رقم الجوال يجب ان يتكون من 14 ارقام";
    }
    return null;
  } */

  String? isValidCardNumber(String? card) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (card!.isEmpty) {
      return "الرجاء ادخال رقم الكارت";
    } else if (card.length < 11) {
      return "رقم الكارت يجب ان يتكون من 16 رقم";
    }
    return null;
  }

  String? isValidCVV(String? card) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (card!.isEmpty) {
      return "الرجاء ادخال رقم الcvv";
    } else if (card.length < 11) {
      return "رقم الcvv يجب ان يتكون من 3 ارقام";
    }
    return null;
  }

////////////////////////////////////////////////////////////////////////////////
  String isValidEmailBloc(String email) {
    if (email.isEmpty) {
      return "الرجاء ادخال البريد الألكتروني بشكل صحيح";
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "الرجاء ادخال البريد الألكتروني";
    }
    return '';
  }

  String isValidPasswordBloc(String password) {
    if (password.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    //capital letter
    else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(password)) {
      return "كلمة المرور يجب ان تحتوي على حرف كبير واحد على الأقل";
    } else if (password.length < 8) {
      return "كلمة المرور يجب ان تكون اكثر من 8 احرف";
    }
    return '';
  }

  String isValidPhoneBloc(String phone) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (phone.isEmpty) {
      return "الرجاء ادخال رقم الجوال";
    } else if (phone.length < 11) {
      return "رقم الجوال يجب ان يتكون من 11 رقم";
    }
    return '';
  }

  String isValidConfirmPasswordBloc(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return "الرجاء ادخال كلمة المرور التأكيدية";
    } else if (confirmPassword != password) {
      return "كلمة المرور غير متطابقة";
    }
    return '';
  }

  String isValidNameBloc(String name) {
    if (name.isEmpty) {
      return "الرجاء ادخال الاسم";
    } else if (name.length < 2) {
      return "الاسم يجب ان يتكون من 2 احرف على الأقل";
    }
    return '';
  }

  String isValidCodeBloc(String code) {
    if (code.isEmpty) {
      return "الرجاء ادخال الكود";
    } /* else if (code.length != 4) {
      return "الكود يجب ان يتكون من 4 ارقام";
    } */
    return '';
  }

////////////////////////////////////////////////////////////////////////////////
  String? isValidConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return "الرجاء ادخال كلمة المرور التأكيدية";
    } else if (confirmPassword != password) {
      return "كلمة المرور غير متطابقة";
    }
    return null;
  }

  String? isValidCode(String? code) {
    if (code!.isEmpty) {
      return "الرجاء ادخال الكود";
    } /* else if (code.length != 4) {
      return "الكود يجب ان يتكون من 4 ارقام";
    } */
    return null;
  }

  String? isValidName(String? name) {
    if (name!.isEmpty) {
      return "الرجاء ادخال الاسم";
    } else if (name.length < 2) {
      return "الاسم يجب ان يتكون من 2 احرف على الأقل";
    }
    return null;
  }

  String? isValidCivilNumber(String? civilNumber) {
    if (civilNumber!.isEmpty) {
      return "الرجاء ادخال الرقم المدني";
    } else if (civilNumber.length != 14) {
      return "الرقم المدني يجب ان يتكون من 14 رقم";
    }
    return null;
  }

  String? isCreditCardNumber(String? creditNumber) {
    if (creditNumber!.isEmpty) {
      return "الرجاء ادخال رقم البطاقة";
    } else if (creditNumber.length != 16) {
      return "رقم البطاقة يجب ان يتكون من 16 رقم";
    }
    return null;
  }

  String? isValidCvvNumber(String? cvvNumber) {
    if (cvvNumber!.isEmpty) {
      return "الرجاء ادخال رقم السي في في";
    } else if (cvvNumber.length != 3) {
      return "رقم السي في في يجب ان يتكون من 3 ارقام";
    }
    return null;
  }
}
