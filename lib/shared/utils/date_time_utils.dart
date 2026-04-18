import 'package:intl/intl.dart';

import '../constants/data_constant.dart';


class DateTimeUtils {
  DateTimeUtils._();

  static final DateFormat normalDateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
  static final DateFormat commonDateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat colonDateFormat = DateFormat('yyyy:MM:dd');
  static final DateFormat onlyHourFormat = DateFormat('HH:mm:ss');
  static final DateFormat monthYearFormat = DateFormat('MM/yyyy');
  static final DateFormat rangeDateFormat = DateFormat('M yyyy');
  static final DateFormat dayMonthFormat = DateFormat('dd/MM');


  static final dateRandom = DateTimeUtils.normalDateFormat.format(DataConstant.defaultDateTime);
}
