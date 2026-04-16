import 'package:soft_dream_test/shared/regex/app_regex.dart';

mixin ValidatorUtils {
  String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Trường không được để trống';
    }
    return null;
  }

  String? emailValidator(String? value, {String? emptyFieldMessage}) {
    if (value?.isEmpty ?? true) {
      return emptyFieldMessage ?? 'Trường không được để trống';
    }
    if (!AppRegex.emailContainRegex.hasMatch(value ?? '')) {
      return 'Email không hợp lệ!';
    }
    return null;
  }

  String? emptyValidator(String? value, {String? emptyFieldMessage}) {
    if (value?.isEmpty ?? true) {
      return emptyFieldMessage ?? 'Trường không được để trống';
    }
    return null;
  }

  String? samePasswordValidator(String? password, String? rePassword) {
    if (password != rePassword) {
      return 'Mật khẩu không khớp';
    }
    return emptyValidator(rePassword);
  }

  bool hasNumber(String value) {
    return AppRegex.numberContainRegex.hasMatch(value);
  }

  bool hasSpecialChar(String value) {
    return AppRegex.specialCharacterContainRegex.hasMatch(value);
  }

  bool hasUpperChar(String value) {
    return AppRegex.upperChar.hasMatch(value);
  }

  bool hasLowerChar(String value) {
    return AppRegex.lowerChar.hasMatch(value);
  }

  bool hasSpace(String value) {
    return AppRegex.hasSpace.hasMatch(value);
  }

  String? newPasswordValidator(String? value) {
    if ((value?.length ?? 0) <= 7 ||
        (value ?? '').toUpperCase() == (value ?? '') ||
        (value ?? '').toLowerCase() == (value ?? '') ||
        !hasNumber(value ?? '') ||
        !hasSpecialChar(value ?? '')) {
      return 'Mật khẩu không hợp lệ!';
    }
    return null;
  }
}
