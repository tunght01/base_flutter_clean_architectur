import 'dart:math';
import 'package:intl/intl.dart';

final NumberFormat integerFormat = NumberFormat('###,###,###,###,###', 'en_US');
final NumberFormat integerFormat10 = NumberFormat(
  '###,###,###,###,##',
  'en_US',
);
final NumberFormat doubleFormat = NumberFormat(
  '###,###,###,###,###.##',
  'en_US',
);
final NumberFormat double4Format = NumberFormat(
  '###,###,###,###,###.####',
  'en_US',
);

enum Compact { million, billion }

extension NumExtensions on num {
  num plus(num other) {
    return this + other;
  }

  num minus(num other) {
    return this - other;
  }

  num times(num other) {
    return this * other;
  }

  num div(num other) {
    return this / other;
  }

  num get nonNegative {
    if (this < 0) {
      return 0;
    }
    return this;
  }

  num get min0 => max(this, 0);

  num get evenLot => (this ~/ 100) * 100;
}

extension NumNullExtensions on num? {
  String formatRate([int fixed = 2]) {
    if (this != null) {
      if (this == this!.toInt()) {
        return '${this!.toInt()}%';
      }
      return '${this!.toStringAsFixed(fixed)}%';
    } else {
      return '0%';
    }
  }

  String get formatVolumeRemoveZero {
    if (this != null) {
      try {
        if (this == 0) {
          return '-';
        }
        return NumberFormat.currency(
          symbol: '',
          decimalDigits: 0,
        ).format(this).replaceAll('.', ',');
      } catch (e) {
        return '-';
      }
    }
    return '-';
  }

  num get min0 => max(this ?? 0, 0);
}

extension IntExtensions on int {
  int plus(int other) {
    return this + other;
  }

  int minus(int other) {
    return this - other;
  }

  int times(int other) {
    return this * other;
  }

  double div(int other) {
    return this / other;
  }

  int truncateDiv(int other) {
    return this ~/ other;
  }
}

extension DoubleExtensions on double {
  double plus(double other) {
    return this + other;
  }

  double minus(double other) {
    return this - other;
  }

  double times(double other) {
    return this * other;
  }

  double div(double other) {
    return this / other;
  }
}

class NumUtils {
  static String formatDouble(num? integer, [String? nullString]) {
    if (_invalidInput(integer)) {
      return nullString ?? '';
    }
    try {
      return doubleFormat.format(integer);
    } catch (e) {
      return nullString ?? '';
    }
  }

  static bool _invalidInput(dynamic data) => data == null;

  static String getRandom() {
    String text = '';
    const String possible =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final Random random = Random();
    for (int i = 0; i < 23; i++) {
      text += possible[(random.nextDouble() * possible.length).toInt()];
    }
    return text;
  }

  static num? parseStringOrNull(String? string) {
    if (string == null) {
      return null;
    }

    return num.tryParse(string);
  }

  static num parseString(String? string, [num defaultValue = 0]) {
    if (string == null) {
      return defaultValue;
    }

    return num.tryParse(string) ?? defaultValue;
  }
}
