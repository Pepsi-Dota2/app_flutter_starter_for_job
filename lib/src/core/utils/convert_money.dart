import 'package:intl/intl.dart';

String formatBaht(String number) {
  final formatCurrency = NumberFormat.currency(
    locale: 'th_TH',
    symbol: '฿',
    decimalDigits: 2,
  );

  final parsedNumber = double.tryParse(number.replaceAll(',', '')) ?? 0.0;

  return formatCurrency.format(parsedNumber);
}
