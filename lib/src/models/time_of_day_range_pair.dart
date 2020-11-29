import 'package:overlapping_time/overlapping_time.dart';
import 'package:flutter/material.dart';

import '../extensions/time_of_day_extension.dart';

/// A pair of [TimeOfDayRange].
class TimeOfDayRangePair extends TimeRangePair {
  const TimeOfDayRangePair({
    @required this.a,
    @required this.b,
  })  : assert(a != null),
        assert(b != null),
        super(rangeA: a, rangeB: b);

  final TimeOfDayRange a;
  final TimeOfDayRange b;

  /// Finds overlapping range between two [TimeOfDayRange]s.
  @override
  TimeOfDayRange getOverlappingRange({bool allowTouchingRanges = false}) {
    // CASE 1: A == B
    //
    // A: |---------|
    // B: |---------|
    if (a == b) {
      return a;
    }

    final int aStart = a.start.inMinutes();
    int aEnd = a.end.inMinutes();
    final int bStart = b.start.inMinutes();
    int bEnd = b.end.inMinutes();

    // Add 24 hours if the range is overnight
    const int additionalMinutes = 24 * 60;
    if (aStart > aEnd) {
      aEnd += additionalMinutes;
    }
    if (bStart > bEnd) {
      bEnd += additionalMinutes;
    }

    // CASE 2: AABB || BBAA
    //
    // (AABB)
    //
    // A: |---------|
    // B:               |---------|
    //
    // or
    //
    // A: |---------|
    // B:           |---------|
    //
    // or
    //
    // (BBAA)
    //
    // A:               |---------|
    // B: |---------|
    //
    // or
    //
    // A:           |---------|
    // B: |---------|
    if (aEnd <= bStart || bEnd <= aStart) {
      if (allowTouchingRanges) {
        if (aEnd == bStart) {
          return TimeOfDayRange(start: a.end, end: b.start);
        } else if (bEnd == aStart) {
          return TimeOfDayRange(start: b.end, end: a.start);
        }
      } else {
        return null;
      }
    }

    /// CASE 3: ABAB
    //
    // A: |---------------|
    // B:         |---------------|
    if ((aStart < bStart) && (bStart < aEnd) && (aEnd < bEnd)) {
      return TimeOfDayRange(start: b.start, end: a.end);
    }

    // CASE 4: ABBA
    //
    // A: |---------------|
    // B:     |------|
    //
    // or
    //
    // A: |---------------|
    // B:          |------|
    //
    // or
    //
    // A: |---------------|
    // B: |------|
    else if ((aStart <= bStart) && (bStart < bEnd) && (bEnd <= aEnd)) {
      return TimeOfDayRange(start: b.start, end: b.end);
    }

    // CASE 5: BABA
    //
    // A:         |---------------|
    // B: |---------------|
    else if ((bStart < aStart) && (aStart < bEnd) && (bEnd < aEnd)) {
      return TimeOfDayRange(start: a.start, end: b.end);
    }

    // CASE 6: BAAB
    //
    // A:     |------|
    // B: |---------------|
    //
    // or
    //
    // A:          |------|
    // B: |---------------|
    //
    // or
    //
    // A: |------|
    // B: |---------------|
    else if ((bStart <= aStart) && (aStart < aEnd) && (aEnd <= bEnd)) {
      return TimeOfDayRange(start: a.start, end: a.end);
    }

    return null;
  }
}
