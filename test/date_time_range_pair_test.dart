import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlapping_time/overlapping_time.dart';

void main() {
  group('operator ==', () {
    test('==', () {
      final DateTimeRangePair pairA = DateTimeRangePair(
        a: DateTimeRange(
          start: DateTime(2020, 1, 1, 1, 0),
          end: DateTime(2020, 1, 1, 3, 0),
        ),
        b: DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 4, 0),
        ),
      );
      final DateTimeRangePair pairB = DateTimeRangePair(
        a: DateTimeRange(
          start: DateTime(2020, 1, 1, 1, 0),
          end: DateTime(2020, 1, 1, 3, 0),
        ),
        b: DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 4, 0),
        ),
      );
      expect(pairA == pairB, true);
    });
    test('!=', () {
      final DateTimeRangePair pairA = DateTimeRangePair(
        a: DateTimeRange(
          start: DateTime(2020, 1, 1, 1, 0),
          end: DateTime(2020, 1, 1, 3, 0),
        ),
        b: DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 4, 0),
        ),
      );
      final DateTimeRangePair pairB = DateTimeRangePair(
        a: DateTimeRange(
          start: DateTime(2020, 1, 1, 1, 0),
          end: DateTime(2020, 1, 1, 3, 0),
        ),
        b: DateTimeRange(
          start: DateTime(2020, 1, 1, 3, 0),
          end: DateTime(2020, 1, 1, 5, 0),
        ),
      );
      expect(pairA == pairB, false);
    });
  });

  group('getOverlappingRanges', () {
    test('A == B', () {
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
        ).getOverlappingRange(),
        DateTimeRange(
          start: DateTime(2020, 1, 1, 1, 0),
          end: DateTime(2020, 1, 1, 2, 0),
        ),
      );
    });
    test('ABAB', () {
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 5, 0),
          ),
        ).getOverlappingRange(),
        DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 4, 0),
        ),
      );
    });
    test('BABA', () {
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 5, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
        ).getOverlappingRange(),
        DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 4, 0),
        ),
      );
    });
    test('ABBA', () {
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ).getOverlappingRange(),
        DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 3, 0),
        ),
      );
    });
    test('BAAB', () {
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
        ).getOverlappingRange(),
        DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 3, 0),
        ),
      );
    });
    test('AABB', () {
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 3, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
        ).getOverlappingRange(),
        null,
      );
      // A.end == B.start
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ).getOverlappingRange(),
        null,
      );
    });
    test('BBAA', () {
      //
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 3, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
        ).getOverlappingRange(),
        null,
      );
      //  B.start == A.end
      expect(
        DateTimeRangePair(
          a: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
          b: DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
        ).getOverlappingRange(),
        null,
      );
    });
  });
  test('ranges are null', () {
    expect(
      () => DateTimeRangePair(a: null, b: null).getOverlappingRange(),
      throwsAssertionError,
    );
  });
}
