import 'package:intl/intl.dart';

String formatDate(String dateString) {
  try {
    final date = DateFormat('dd-MM-yyyy').parse(dateString);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final formattedDate = DateTime(date.year, date.month, date.day);

    if (formattedDate == today) {
      return 'Today';
    } else if (formattedDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('dd MMM yyyy').format(date); // e.g., 10 Jul 2025
    }
  } catch (e) {
    return dateString;
  }
}
