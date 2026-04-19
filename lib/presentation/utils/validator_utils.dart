import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/shared/regex/app_regex.dart';

mixin ValidatorUtils {
  String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return S.current.password_have_to_over_6_charactor;
    }
    if (value!.length < 6 && value.length > 50) {
      return S.current.password_have_to_over_6_charactor;
    }
    return null;
  }

  String? emailValidator(String? value, {String? emptyFieldMessage}) {
    if (value?.isEmpty ?? true) {
      return emptyFieldMessage ?? S.current.login_error_empty_email;
    }
    if (!AppRegex.emailContainRegex.hasMatch(value ?? '')) {
      return S.current.login_error_invalid_email;
    }
    return null;
  }

  String? emptyValidator(String? value, {String? emptyFieldMessage}) {
    if (value?.isEmpty ?? true) {
      return emptyFieldMessage ?? S.current.field_not_empty;
    }
    return null;
  }

  String? samePasswordValidator(String? password, String? rePassword) {
    if (password != rePassword) {
      return S.current.not_match_password;
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
      return S.current.invalid_password;
    }
    return null;
  }

  String? priceValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.field_not_empty;
    }

    final price = double.tryParse(value.trim());

    if (price == null) {
      return S.current.invalid_price;
    }

    if (price <= 0) {
      return S.current.invalid_price;
    }

    return null; // hợp lệ
  }
}
