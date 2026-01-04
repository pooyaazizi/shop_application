import 'package:intl/intl.dart';

extension IntFormatting on int {
  String toSeparated() =>
      NumberFormat.decimalPattern().format(this);
}

extension DoubleFormatting on double {
  String toPercent() => toStringAsFixed(1) + ' %';
}
