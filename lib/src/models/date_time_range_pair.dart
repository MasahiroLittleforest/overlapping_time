import 'package:flutter/material.dart';
import 'package:overlapping_time/overlapping_time.dart';

import '../extensions/date_time_extension.dart';

/// A pair of [DateTimeRange].
class DateTimeRangePair extends TimeRangePair {
  const DateTimeRangePair({
    required this.a,
    required this.b,
  }) : super(rangeA: a, rangeB: b);

  final DateTimeRange a;
  final DateTimeRange b;

  /// Finds overlapping range between two [DateTimeRange]s.
  @override
  DateTimeRange? getOverlappingRange({bool allowTouchingRanges = false}) {
    // CASE 1: A == B
    //
    // A: |---------|
    // B: |---------|
    if (a == b) {
      return a;
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
    if (a.end <= b.start || b.end <= a.start) {
      if (allowTouchingRanges) {
        if (a.end == b.start) {
          return DateTimeRange(start: a.end, end: b.start);
        } else if (b.end == a.start) {
          return DateTimeRange(start: b.end, end: a.start);
        }
      } else {
        return null;
      }
    }

    // CASE 3: ABAB
    //
    // A: |---------------|
    // B:         |---------------|
    if ((a.start < b.start) && (b.start < a.end) && (a.end < b.end)) {
      return DateTimeRange(start: b.start, end: a.end);
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
    else if ((a.start <= b.start) && (b.start < b.end) && (b.end <= a.end)) {
      return DateTimeRange(start: b.start, end: b.end);
    }

    // CASE 5: BABA
    //
    // A:         |---------------|
    // B: |---------------|
    else if ((b.start < a.start) && (a.start < b.end) && (b.end < a.end)) {
      return DateTimeRange(start: a.start, end: b.end);
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
    else if ((b.start <= a.start) && (a.start < a.end) && (a.end <= b.end)) {
      return DateTimeRange(start: a.start, end: a.end);
    }

    return null;
  }
}
