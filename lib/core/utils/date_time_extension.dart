import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String getFormattedDate() {
    return DateFormat("yyyy-MM-dd").format(this);
  }
}
