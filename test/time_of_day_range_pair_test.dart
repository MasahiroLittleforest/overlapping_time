import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlapping_time/overlapping_time.dart';

void main() {
  group('operator ==', () {
    test('==', () {
      const TimeOfDayRangePair pairA = TimeOfDayRangePair(
        a: TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 3, minute: 0),
        ),
        b: TimeOfDayRange(
          start: TimeOfDay(hour: 2, minute: 0),
          end: TimeOfDay(hour: 4, minute: 0),
        ),
      );
      const TimeOfDayRangePair pairB = TimeOfDayRangePair(
        a: TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 3, minute: 0),
        ),
        b: TimeOfDayRange(
          start: TimeOfDay(hour: 2, minute: 0),
          end: TimeOfDay(hour: 4, minute: 0),
        ),
      );
      expect(
        pairA == pairB,
        true,
      );
    });
    test('!=', () {
      const TimeOfDayRangePair pairA = TimeOfDayRangePair(
        a: TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 3, minute: 0),
        ),
        b: TimeOfDayRange(
          start: TimeOfDay(hour: 2, minute: 0),
          end: TimeOfDay(hour: 4, minute: 0),
        ),
      );
      const TimeOfDayRangePair pairB = TimeOfDayRangePair(
        a: TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 3, minute: 0),
        ),
        b: TimeOfDayRange(
          start: TimeOfDay(hour: 3, minute: 0),
          end: TimeOfDay(hour: 5, minute: 0),
        ),
      );
      expect(
        pairA == pairB,
        false,
      );
    });
  });

  group('getOverlappingRange', () {
    test('A == B', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 2, minute: 0),
        ),
      );
    });
    test('ABAB', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 5, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 3, minute: 0),
            end: TimeOfDay(hour: 7, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 3, minute: 0),
          end: TimeOfDay(hour: 5, minute: 0),
        ),
      );
    });
    test('BABA', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 13, minute: 0),
            end: TimeOfDay(hour: 15, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 10, minute: 0),
            end: TimeOfDay(hour: 14, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 13, minute: 0),
          end: TimeOfDay(hour: 14, minute: 0),
        ),
      );
    });
    test('ABBA', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 6, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 3, minute: 0),
            end: TimeOfDay(hour: 4, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 3, minute: 0),
          end: TimeOfDay(hour: 4, minute: 0),
        ),
      );
    });
    test('BAAB', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 3, minute: 0),
            end: TimeOfDay(hour: 5, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 6, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 3, minute: 0),
          end: TimeOfDay(hour: 5, minute: 0),
        ),
      );
    });
    test('AABB', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 3, minute: 0),
            end: TimeOfDay(hour: 4, minute: 0),
          ),
        ).getOverlappingRange(),
        null,
      );
      // A.end == B.start
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ).getOverlappingRange(),
        null,
      );
    });
    test('BBAA', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 3, minute: 0),
            end: TimeOfDay(hour: 4, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
        ).getOverlappingRange(),
        null,
      );
      // B.end == A.start
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
        ).getOverlappingRange(),
        null,
      );
    });

    test('find overlapping time of day with overnight ranges', () {
      // ABAB && overnight
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 22, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 23, minute: 0),
            end: TimeOfDay(hour: 4, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 23, minute: 0),
          end: TimeOfDay(hour: 3, minute: 0),
        ),
      );
      // BABA && overnight
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 23, minute: 0),
            end: TimeOfDay(hour: 4, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 22, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 23, minute: 0),
          end: TimeOfDay(hour: 3, minute: 0),
        ),
      );
      // ABBA && over night
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 22, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 23, minute: 0),
            end: TimeOfDay(hour: 1, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 23, minute: 0),
          end: TimeOfDay(hour: 1, minute: 0),
        ),
      );
      // BAAB && over night
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 23, minute: 0),
            end: TimeOfDay(hour: 1, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 22, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ).getOverlappingRange(),
        const TimeOfDayRange(
          start: TimeOfDay(hour: 23, minute: 0),
          end: TimeOfDay(hour: 1, minute: 0),
        ),
      );
    });

    test('no overlapping', () {
      expect(
        const TimeOfDayRangePair(
          a: TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
          b: TimeOfDayRange(
            start: TimeOfDay(hour: 4, minute: 0),
            end: TimeOfDay(hour: 6, minute: 0),
          ),
        ).getOverlappingRange(),
        null,
      );
    });
  });

  test('ranges are null', () {
    expect(
      () => TimeOfDayRangePair(a: null, b: null).getOverlappingRange(),
      throwsAssertionError,
    );
  });
}
