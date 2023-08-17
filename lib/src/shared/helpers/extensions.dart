extension StringExtension on String
{
  /// Capitalizes the first letter of the string
  String get capitalizeFirst {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get upperCasex {
    return "${this[0].toUpperCase()} X";
  }
}

extension DateExtension on DateTime {
  /// Format date to yyyy/mm/dd
  String get formmated {
    return "$year/$month/$day";
  }
}
