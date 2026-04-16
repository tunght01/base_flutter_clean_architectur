class AppRegex {
  static final accountRegex = RegExp(r'^(\d{3}[A-Z])(\d{6})$');
  static final RegExp phoneNumberRegex = RegExp(
      r'^(?:\+84|0)(3[2-9]|5[2689]|7[0|6-9]|8[1-9]|9[0-9])\d{7}$'
  );
  static final RegExp passwordRegex = RegExp(
      r'''^(?=.*[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ])(?=.*[a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ])(?=.*[0-9])(?=.*[~`!@#$%^&*()_+={}|:;\'\"<,>.?\-\[\]\/\\])[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐa-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ0-9~`!@#$%^&*()_+={}|:;\'\"<,>.?\-\[\]\/\\]{8,25}$''');
  static final RegExp normalWordContainRegex = RegExp(
      r'^(?=.*[a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]).*$');
  static final RegExp specialCharacterContainRegex =
      RegExp(r'''^(?=.*[~`!@#$%^&*()_+={}|:;\'\"<,>.?\-\[\]\/\\]).*$''');

  static final RegExp upperWordContainRegex = RegExp(
      r'^(?=.*[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ]).*$');

  static final RegExp numberContainRegex = RegExp(r'^(?=.*[0-9]).*$');

  static final RegExp nickNameRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_ -]{5,19}$');

  static final RegExp hasSpace = RegExp(r'\s');

  static final RegExp emailContainRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+");

  static final RegExp regExpValue = RegExp(r'^\d+(\.\d{1,2})?$');

  static final RegExp keyRegex = RegExp(r'^[A-Z2-7=]+$');



  static final RegExp upperChar  =  RegExp(r'[A-Z]');

  static final RegExp lowerChar =  RegExp(r'[a-z]');



}
