import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PricePercentageInputFormatter<T extends num> extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = '';
    if (newValue.text.isNotEmpty &&
        (newValue.text.substring(0, 1) == ',' ||
            newValue.text.substring(0, 1) == '.')) {
      text = '0.';
    } else if (newValue.text.replaceAll(',', '.').split('.').length > 2) {
      text = newValue.text.substring(0, newValue.text.length - 1);
    } else {
      text = newValue.text.replaceAll(',', '.');
    }

    if (text.split('.').length > 2) {
      final parts = text.split('.');
      text = '${parts[0]}.${parts[1]}';
    }

    return TextEditingValue(
      text: text
          .replaceAll(',', '.')
          .replaceAllMapped(
            RegExp(r'(\.\d{2})\d+'),
            (match) => match[1].toString(),
          ),
      selection: TextSelection.fromPosition(TextPosition(offset: text.length)),
    );
  }
}

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final NumberFormat f = NumberFormat('#,###', 'en_US');
      final int number = int.parse(
        newValue.text.replaceAll(f.symbols.GROUP_SEP, ''),
      );
      final String newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
