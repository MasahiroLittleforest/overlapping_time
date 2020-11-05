import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlapping_time/overlapping_time.dart';

void main() {
  group('get duration', () {
    test('start <= end', () {
      expect(
        const TimeOfDayRange(
          start: TimeOfDay(hour: 2, minute: 0),
          end: TimeOfDay(hour: 13, minute: 0),
        ).duration,
        const Duration(hours: 11),
      );
      expect(
        const TimeOfDayRange(
          start: TimeOfDay(hour: 2, minute: 0),
          end: TimeOfDay(hour: 2, minute: 0),
        ).duration,
        Duration.zero,
      );
    });
    test('start > end', () {
      expect(
        const TimeOfDayRange(
          start: TimeOfDay(hour: 22, minute: 0),
          end: TimeOfDay(hour: 2, minute: 0),
        ).duration,
        const Duration(hours: 4),
      );
      expect(
        const TimeOfDayRange(
          start: TimeOfDay(hour: 12, minute: 45),
          end: TimeOfDay(hour: 2, minute: 30),
        ).duration,
        const Duration(hours: 13, minutes: 45),
      );
    });
  });

  group('operator ==', () {
    test('==', () {
      const TimeOfDayRange range1 = TimeOfDayRange(
        start: TimeOfDay(hour: 1, minute: 0),
        end: TimeOfDay(hour: 2, minute: 0),
      );
      const TimeOfDayRange range2 = TimeOfDayRange(
        start: TimeOfDay(hour: 1, minute: 0),
        end: TimeOfDay(hour: 2, minute: 0),
      );
      expect(range1 == range2, true);
    });
    test('!=', () {
      const TimeOfDayRange range1 = TimeOfDayRange(
        start: TimeOfDay(hour: 1, minute: 0),
        end: TimeOfDay(hour: 2, minute: 0),
      );
      const TimeOfDayRange range2 = TimeOfDayRange(
        start: TimeOfDay(hour: 2, minute: 0),
        end: TimeOfDay(hour: 1, minute: 0),
      );
      expect(range1 == range2, false);
    });
  });
}
