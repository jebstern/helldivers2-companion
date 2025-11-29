// ignore_for_file: lines_longer_than_80_chars

import "package:clock/clock.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

extension BuildContextX on BuildContext {
  String localizedUnit(int count, String unitKey) {
    final String plural = count == 1 ? unitKey : "${unitKey}_plural";

    // Placeholder strings (will be replace with AppLocalizations.of(this)! when localizing)
    // final units = {
    //   'minute': AppLocalizations.of(this)!.minute,
    //   'minute_plural': AppLocalizations.of(this)!.minutes,

    final Map<String, String> units = <String, String>{
      "minute": "minute",
      "minute_plural": "minutes",
      "gallon": "gallon",
      "gallon_plural": "gallons",
      //"day": "day",
      //"day_plural": "days",
    };

    final String unit = units[plural] ?? unitKey;
    return "$count $unit";
  }
}

extension StringX on String? {
  bool get isBlank => this?.isEmpty ?? true;
  bool get isNotNullOrEmpty => this?.isNotEmpty ?? false;

  String get capitalize {
    if (this == null) {
      return "";
    }
    if (this!.isEmpty) {
      return "";
    }
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }

  DateTime? get yyyyMMddHHmmssS {
    if (this == null) {
      return null;
    }
    final DateTime dt = DateFormat(
      "yyyy-MM-dd HH:mm:ss.S",
    ).parse(this!, true).toLocal();

    return dt;
  }

  DateTime? get notificationDatetime {
    if (this == null) {
      return null;
    }

    String date = this!;
    if (date.length > 23) {
      date = date.substring(0, 23);
    }

    final DateTime dateTime = DateFormat(
      "yyyy-MM-dd HH:mm:ss.S",
    ).parse(date, true).toLocal();

    return dateTime;
  }

  DateTime? get yyyyMMddZHHmmssS {
    if (this == null) {
      return null;
    }
    final DateTime dt = DateFormat(
      "yyyy-MM-ddTHH:mm:ss.S",
    ).parse(this!, true).toLocal();

    return dt;
  }

  DateTime? get yyyyMMddZHHmmss {
    if (this == null) {
      return null;
    }
    final DateTime dt = DateFormat(
      "yyyy-MM-ddTHH:mm:ss",
    ).parse(this!, true).toLocal();

    return dt;
  }

  DateTime? get yyyyMMddHHmmss {
    if (this == null) {
      return null;
    }
    final DateTime dt = DateFormat(
      "yyyy-MM-dd HH:mm:ss",
    ).parse(this!, true).toLocal();

    return dt;
  }

  double get parseDouble {
    if (this == null) {
      return 0;
    }
    return double.tryParse(this ?? "0") ?? 0;
  }

  bool equalsIgnoreCase(String? otherString) =>
      this?.toLowerCase() == otherString?.toLowerCase();

  String? get dotifie => this?.replaceAll(",", ".");
}

extension DateTimeX on DateTime {
  String get toEdm => DateFormat("EEEE, MMMM d").format(this);
  String get toEEE => DateFormat("EEE").format(this);
  String get toEEEd => DateFormat("EEE d").format(this);
  String get toMMM => DateFormat("MMM").format(this);
  String get toMMMM => DateFormat("MMMM").format(this);
  String get toMMMMy => DateFormat("MMMM, y").format(this);
  String get toMMMD => DateFormat("MMM d").format(this);
  String get toMMMDy => DateFormat("MMM d, y").format(this);
  String get toy => DateFormat("y").format(this);
  String get toHHmm => DateFormat("HH:mm").format(this);
  String get toHmma => DateFormat("h:mm a").format(this);
  String get toHmm => DateFormat("h:mm").format(this);
  String get toyyyyMMddHHmmssZ =>
      DateFormat("yyyy-MM-dd HH:mm:ss'Z'").format(this);
  String get toyyyyMMddHHmmss => DateFormat("yyyy-MM-dd HH:mm:ss").format(this);
  DateTime get beginningOfHour => DateTime(year, month, day, hour);
  DateTime get sundayOfWeek => DateTime(year, month, (7 - weekday) + day);
  DateTime get mondayOfWeek => DateTime(year, month, day - (weekday - 1));
  String get toMMMdhmma => DateFormat("MMM d @ h:mm a").format(this);

  String get timeAgoDays {
    final DateTime now = clock.now();
    if (DateUtils.isSameDay(this, now)) {
      return "Today";
    } else {
      final DateTime yesterday = now.subtract(const Duration(days: 1));
      if (DateUtils.isSameDay(yesterday, this)) {
        return "Yesterday";
      } else {
        return toMMMD;
      }
    }
  }

  String get timeAgo {
    final DateTime now = clock.now();
    final Duration difference = now.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return toMMMD;
    } else if (difference.inDays >= 1) {
      return "${difference.inDays} d";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours} h";
    } else if (difference.inMinutes >= 1) {
      return "${difference.inMinutes} m";
    } else {
      return "${difference.inSeconds} s";
    }
  }

  /// Algorithm from https://en.wikipedia.org/wiki/ISO_week_date#Algorithms
  int get weekOfYear {
    // Calculate the ordinal date (number of days since the start of the year)
    final int ordinalDate = difference(DateTime(year)).inDays + 1;

    // Calculate ISO week number
    // Adjust by adding 3 to always compare with January 4th, which is always in week 1
    final int woy = (ordinalDate - weekday + 10) ~/ 7;

    // If the week number equals zero, it means the given date belongs to the previous year
    if (woy == 0) {
      // The 28th of December is always in the last week of the previous year
      return DateTime(year - 1, 12, 28).weekOfYear;
    }

    // If the week number equals 53, check if it's actually in week 1 of the next year
    if (woy == 53) {
      // Check if the current year is valid and if December 31 is Thursday
      if (DateTime(year).weekday == DateTime.thursday ||
          DateTime(year, 12, 31).weekday == DateTime.thursday) {
        return 53;
      } else {
        return 1; // It should be the first week of the next year
      }
    }

    // Return the week number
    return woy;
  }

  /// The ordinal date, the number of days since December 31st the previous year.
  ///
  /// January 1st has the ordinal date 1
  ///
  /// December 31st has the ordinal date 365, or 366 in leap years
  int get ordinalDate {
    const List<int> offsets = <int>[
      0,
      31,
      59,
      90,
      120,
      151,
      181,
      212,
      243,
      273,
      304,
      334,
    ];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }

  /// True if this date is on a leap year.
  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  String timeAgoNotification({DateTime? startDate}) {
    final DateTime date = startDate ?? clock.now();
    final Duration difference = date.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      final int weeks = (difference.inDays / 7).floor();
      final String s = weeks == 1 ? "" : "s";
      return "in $weeks week$s";
    } else if (difference.inDays >= 1) {
      final String s = difference.inDays == 1 ? "" : "s";
      return "in ${difference.inDays} day$s";
    } else if (difference.inHours >= 1) {
      final String s = difference.inHours == 1 ? "" : "s";
      return "in ${difference.inHours} hour$s";
    } else if (difference.inMinutes >= 1) {
      final String s = difference.inMinutes == 1 ? "" : "s";
      return "in ${difference.inMinutes} minute$s";
    } else {
      return "in ${difference.inSeconds} seconds";
    }
  }

  String timeAgoLong({DateTime? startDate}) {
    final DateTime date = startDate ?? clock.now();
    final Duration difference = date.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return "since $toMMMD";
    } else if (difference.inDays >= 1) {
      final String s = difference.inDays == 1 ? "" : "s";
      return "in ${difference.inDays} day$s";
    } else if (difference.inHours >= 1) {
      final String s = difference.inHours == 1 ? "" : "s";
      return "in ${difference.inHours} hour$s";
    } else if (difference.inMinutes >= 1) {
      return "in ${difference.inMinutes} min";
    } else {
      return "in ${difference.inSeconds} sec";
    }
  }

  String get timeAgoNotifications {
    final DateTime date = clock.now();
    final Duration difference = date.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      final int weeks = (difference.inDays / 7).floor();
      return "$weeks w";
    } else if (difference.inDays >= 1) {
      return "${difference.inDays} d";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours} h";
    } else if (difference.inMinutes >= 1) {
      return "${difference.inMinutes} m";
    } else {
      return "${difference.inSeconds} s";
    }
  }

  bool isSameYear(DateTime otherDate) => year == otherDate.year;
  bool isSameMonth(DateTime otherDate) =>
      DateUtils.isSameMonth(this, otherDate);
  bool isSameWeek(DateTime otherDate) =>
      isSameYear(otherDate) && weekOfYear == otherDate.weekOfYear;
  bool isSameDay(DateTime otherDate) => DateUtils.isSameDay(this, otherDate);
  bool isLastYear(DateTime otherDate) => otherDate.year == (year - 1);
}

extension DoubleX on double {
  double get toGallons => this / 3.785;
  double get toLitres => this * 3.785;
  double get toZeroIfInfinite =>
      isNaN || this == double.infinity || this == double.negativeInfinity
      ? 0
      : this;

  double withDecimals(int fractionDigits) {
    // Use `toStringAsFixed` to round the number.
    final double result = double.parse(toStringAsFixed(fractionDigits));

    // If no decimal places are requested and the result is a whole number, return it as an integer.
    if (fractionDigits == 0 && result == result.toInt()) {
      return result
          .toInt()
          .toDouble(); // Convert to int and back to double to remove decimals.
    }

    return result;
  }
}

extension GlobalKeyX on GlobalKey {
  Rect? get globalPaintBounds {
    final RenderObject? renderObject = currentContext?.findRenderObject();
    final Matrix4? matrix = renderObject?.getTransformTo(null);

    if (matrix != null && renderObject?.paintBounds != null) {
      final Rect rect = MatrixUtils.transformRect(
        matrix,
        renderObject!.paintBounds,
      );
      return rect;
    } else {
      return null;
    }
  }
}

extension Intx on int {
  String get toMMss {
    if (this <= 0) {
      return "00:00";
    }

    final int sec = this % 60;
    final int min = (this / 60).floor();
    final String minute = min.toString().length <= 1 ? "0$min" : "$min";
    final String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }
}
