import 'package:flutter/material.dart';

import '../extensions/time_of_day_extension.dart';

/// A range of [TimeOfDay].
@immutable
class TimeOfDayRange {
  /// Creates a time range for the given start and end [TimeOfDay].
  ///
  /// [start] and [end] must be non-null.
  const TimeOfDayRange({
    @required this.start,
    @required this.end,
  })  : assert(start != null),
        assert(end != null);

  /// The **start** point of the range.
  final TimeOfDay start;

  /// The **end** point of the range.
  final TimeOfDay end;

  /// Returns a [Duration] of the time between [start] and [end].
  ///
  /// If the end time is earlier than the start time,
  /// the end time is considered as that time of the next day.
  ///
  /// e.g. 22:00 - 02:00  ->  22:00 - 26:00
  Duration get duration {
    final int startTimeInMinutes = start.inMinutes();
    final int endTimeInMinutes = end.inMinutes();
    int diffInMinutes;

    if (startTimeInMinutes <= endTimeInMinutes) {
      diffInMinutes = endTimeInMinutes - startTimeInMinutes;
    } else {
      const int additionalMinutes = 24 * 60;
      diffInMinutes =
          (endTimeInMinutes + additionalMinutes) - startTimeInMinutes;
    }

    return Duration(minutes: diffInMinutes);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return (other is TimeOfDayRange) &&
        (other.start == start) &&
        (other.end == end);
  }

  @override
  int get hashCode => hashValues(start, end);

  @override
  String toString() => '$start - $end';
}
