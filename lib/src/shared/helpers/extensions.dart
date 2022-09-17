extension StringExtension on String {
  String get capitalizeFirst {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get upperCasex {
    return "${this[0].toUpperCase()} X";
  }
}

extension DateExtension on DateTime {
  String get formmated {
    return "$year/$month/$day";
  }
}
