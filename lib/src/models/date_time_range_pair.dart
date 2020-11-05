import 'package:flutter/material.dart';
import 'package:overlapping_time/overlapping_time.dart';
import 'package:basics/date_time_basics.dart';

/// A pair of [DateTimeRange].
class DateTimeRangePair extends TimeRangePair {
  const DateTimeRangePair({
    @required this.a,
    @required this.b,
  })  : assert(a != null),
        assert(b != null),
        super(rangeA: a, rangeB: b);

  final DateTimeRange a;
  final DateTimeRange b;

  /// Finds overlapping range between two [DateTimeRange]s.
  @override
  DateTimeRange getOverlappingRange() {
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
      return null;
    }

    DateTimeRange overlappingDateTimeRange;

    // CASE 3: ABAB
    //
    // A: |---------------|
    // B:         |---------------|
    if ((a.start < b.start) && (b.start < a.end) && (a.end < b.end)) {
      overlappingDateTimeRange = DateTimeRange(start: b.start, end: a.end);
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
      overlappingDateTimeRange = DateTimeRange(start: b.start, end: b.end);
    }

    // CASE 5: BABA
    //
    // A:         |---------------|
    // B: |---------------|
    else if ((b.start < a.start) && (a.start < b.end) && (b.end < a.end)) {
      overlappingDateTimeRange = DateTimeRange(start: a.start, end: b.end);
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
      overlappingDateTimeRange = DateTimeRange(start: a.start, end: a.end);
    }

    return overlappingDateTimeRange;
  }
}
