import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }
}
