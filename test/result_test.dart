import 'package:overlapping_time/overlapping_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('valid arguments', () {
    test(
        'comparedRanges: List<TimeOfDayRange>, overlappingRange: TimeOfDayRange',
        () {
      expect(
        ComparingResult(
          comparedRanges: const [
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 3, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 4, minute: 0),
            ),
          ],
          overlappingRange: const TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ),
        ComparingResult(
          comparedRanges: const [
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 3, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 4, minute: 0),
            ),
          ],
          overlappingRange: const TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ),
      );
    });

    test('comparedRanges: List<DateTimeRange>, overlappingRange: DateTimeRange',
        () {
      expect(
        ComparingResult(
          comparedRanges: [
            DateTimeRange(
              start: DateTime(2020, 1, 1, 1, 0),
              end: DateTime(2020, 1, 1, 3, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 2, 0),
              end: DateTime(2020, 1, 1, 4, 0),
            ),
          ],
          overlappingRange: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ),
        ComparingResult(
          comparedRanges: [
            DateTimeRange(
              start: DateTime(2020, 1, 1, 1, 0),
              end: DateTime(2020, 1, 1, 3, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 2, 0),
              end: DateTime(2020, 1, 1, 4, 0),
            ),
          ],
          overlappingRange: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ),
      );
    });
  });

  group('different types', () {
    test(
        'comparedRanges: List<TimeOfDayRange>, overlappingRange: DateTimeRange',
        () {
      expect(
        () => ComparingResult(
          comparedRanges: const [
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 3, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 4, minute: 0),
            ),
          ],
          overlappingRange: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ),
        throwsAssertionError,
      );
    });

    test(
        'comparedRanges: List<DateTimeRange>, overlappingRange: TimeOfDayRange',
        () {
      expect(
        () => ComparingResult(
          comparedRanges: [
            DateTimeRange(
              start: DateTime(2020, 1, 1, 1, 0),
              end: DateTime(2020, 1, 1, 3, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 2, 0),
              end: DateTime(2020, 1, 1, 4, 0),
            ),
          ],
          overlappingRange: const TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ),
        throwsAssertionError,
      );
    });
  });

  group('null', () {
    test('comparedRanges: null, overlappingRange: null', () {
      expect(
        () => ComparingResult(comparedRanges: null, overlappingRange: null),
        throwsAssertionError,
      );
    });

    test('comparedRanges: List<TimeOfDayRange>, overlappingRange: null', () {
      expect(
        () => ComparingResult(
          comparedRanges: const [
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 3, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 4, minute: 0),
            ),
          ],
          overlappingRange: null,
        ),
        throwsAssertionError,
      );
    });

    test('comparedRanges: null, overlappingRange: TimeOfDayRange', () {
      expect(
        () => ComparingResult(
          comparedRanges: null,
          overlappingRange: const TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ),
        throwsAssertionError,
      );
    });

    test('comparedRanges: List<DateTimeRange>, overlappingRange: null', () {
      expect(
        () => ComparingResult(comparedRanges: [
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
        ], overlappingRange: null),
        throwsAssertionError,
      );
    });

    test('comparedRanges: null, overlappingRange: DateTimeRange', () {
      expect(
        () => ComparingResult(
          comparedRanges: null,
          overlappingRange: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ),
        throwsAssertionError,
      );
    });
  });
  group('empty list', () {
    test('comparedRanges: [], overlappingRange: TimeOfDayRange', () {
      expect(
        () => ComparingResult(
          comparedRanges: const [],
          overlappingRange: const TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ),
        throwsAssertionError,
      );
    });
    test('comparedRanges: [], overlappingRange: DateTimeRange', () {
      expect(
        () => ComparingResult(
          comparedRanges: const [],
          overlappingRange: DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ),
        throwsAssertionError,
      );
    });
    test('comparedRanges: [], overlappingRange: null', () {
      expect(
        () => ComparingResult(
          comparedRanges: const [],
          overlappingRange: null,
        ),
        throwsAssertionError,
      );
    });
  });
}
