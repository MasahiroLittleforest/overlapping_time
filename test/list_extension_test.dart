import 'package:overlapping_time/overlapping_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlapping_time/src/extensions/list_extension.dart';

void main() {
  group('hasUniqueElements', () {
    group('List<String>', () {
      test('List<String> w/o duplication', () {
        expect(<String>['a', 'b', 'c', 'd'].hasUniqueElements, true);
      });
      test('List<String> w/ duplication', () {
        expect(<String>['a', 'b', 'c', 'a'].hasUniqueElements, false);
      });
    });
    group('List<int>', () {
      test('List<int> w/o duplication', () {
        expect(<int>[1, 2, 3, 4].hasUniqueElements, true);
      });
      test('List<int> w/ duplication', () {
        expect(<int>[1, 2, 3, 1].hasUniqueElements, false);
      });
    });

    group('List<TimeOfDay>', () {
      test('List<TimeOfDay> w/o duplication', () {
        expect(
          const <TimeOfDay>[
            TimeOfDay(hour: 1, minute: 0),
            TimeOfDay(hour: 2, minute: 0),
            TimeOfDay(hour: 3, minute: 0),
            TimeOfDay(hour: 4, minute: 0),
          ].hasUniqueElements,
          true,
        );
      });
      test('List<TimeOfDay> w/ duplication', () {
        expect(
          const <TimeOfDay>[
            TimeOfDay(hour: 1, minute: 0),
            TimeOfDay(hour: 2, minute: 0),
            TimeOfDay(hour: 3, minute: 0),
            TimeOfDay(hour: 1, minute: 0),
          ].hasUniqueElements,
          false,
        );
      });
    });
    group('List<DateTime>', () {
      test('List<DateTime> w/o duplication', () {
        expect(
          <DateTime>[
            DateTime(2020, 1, 1, 1, 0),
            DateTime(2020, 1, 1, 2, 0),
            DateTime(2020, 1, 1, 3, 0),
            DateTime(2020, 1, 1, 4, 0),
          ].hasUniqueElements,
          true,
        );
      });
      test('List<DateTime> w/ duplication', () {
        expect(
          <DateTime>[
            DateTime(2020, 1, 1, 1, 0),
            DateTime(2020, 1, 1, 2, 0),
            DateTime(2020, 1, 1, 3, 0),
            DateTime(2020, 1, 1, 1, 0),
          ].hasUniqueElements,
          false,
        );
      });
    });
    group('List<TimeOfDayRange>', () {
      test('List<TimeOfDayRange> w/o duplication', () {
        expect(
          const <TimeOfDayRange>[
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 2, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 3, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 3, minute: 0),
              end: TimeOfDay(hour: 4, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 4, minute: 0),
              end: TimeOfDay(hour: 5, minute: 0),
            ),
          ].hasUniqueElements,
          true,
        );
      });
      test('List<TimeOfDayRange> w/ duplication', () {
        expect(
          const <TimeOfDayRange>[
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 2, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 3, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 3, minute: 0),
              end: TimeOfDay(hour: 4, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 2, minute: 0),
            ),
          ].hasUniqueElements,
          false,
        );
      });
    });
    group('List<DateTimeRange>', () {
      test('List<DateTimeRange> w/o duplication', () {
        expect(
          <DateTimeRange>[
            DateTimeRange(
              start: DateTime(2020, 1, 1, 1, 0),
              end: DateTime(2020, 1, 1, 2, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 2, 0),
              end: DateTime(2020, 1, 1, 3, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 3, 0),
              end: DateTime(2020, 1, 1, 4, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 4, 0),
              end: DateTime(2020, 1, 1, 5, 0),
            ),
          ].hasUniqueElements,
          true,
        );
      });
      test('List<DateTimeRange> w/ duplication', () {
        expect(
          <DateTimeRange>[
            DateTimeRange(
              start: DateTime(2020, 1, 1, 1, 0),
              end: DateTime(2020, 1, 1, 2, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 2, 0),
              end: DateTime(2020, 1, 1, 3, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 3, 0),
              end: DateTime(2020, 1, 1, 4, 0),
            ),
            DateTimeRange(
              start: DateTime(2020, 1, 1, 1, 0),
              end: DateTime(2020, 1, 1, 2, 0),
            ),
          ].hasUniqueElements,
          false,
        );
      });
    });

    test('empty list', () {
      expect([].hasUniqueElements, true);
    });
  });

  group('getElementsTypes', () {
    test('String', () {
      expect(['a', 'b', 'c', 'd'].getElementsTypes(), [String]);
    });
    test('String & int', () {
      expect(['1', 2, '3', 4].getElementsTypes(), [String, int]);
    });
    test('TimeOfDay & DateTime', () {
      expect(
        [
          const TimeOfDay(hour: 1, minute: 0),
          DateTime(2020, 1, 1, 2, 0),
        ].getElementsTypes(),
        [TimeOfDay, DateTime],
      );
    });
    test('String & Null', () {
      expect(['a', 'b', 'c', null].getElementsTypes(), [String, Null]);
    });
    test('Null', () {
      expect([null, null, null, null].getElementsTypes(), [Null]);
    });
    test('empty lsit', () {
      expect([].getElementsTypes(), []);
    });
  });

  group('areSame', () {
    test('String', () {
      expect(['a', 'a', 'a', 'a'].areSame, true);
      expect(['a', 'a', 'a', 'b'].areSame, false);
    });

    test('String and int', () {
      expect([1, '2', 3, '4'].areSame, false);
    });

    test('TimeOfDay', () {
      expect(
        const [
          TimeOfDay(hour: 1, minute: 0),
          TimeOfDay(hour: 1, minute: 0),
        ].areSame,
        true,
      );
      expect(
        const [
          TimeOfDay(hour: 1, minute: 0),
          TimeOfDay(hour: 2, minute: 0),
        ].areSame,
        false,
      );
    });

    test('DateTime', () {
      expect(
        [
          DateTime(2020, 1, 1, 1, 0),
          DateTime(2020, 1, 1, 1, 0),
        ].areSame,
        true,
      );
      expect(
        [
          DateTime(2020, 1, 1, 1, 0),
          DateTime(2020, 1, 1, 2, 0),
        ].areSame,
        false,
      );
    });

    test('TimeOfDayRange', () {
      expect(
        const [
          TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
          TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 2, minute: 0),
          ),
        ].areSame,
        true,
      );
    });

    test('DateTimeRange', () {
      expect(
        [
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 2, 0),
          ),
        ].areSame,
        true,
      );
    });

    test('empty list', () {
      final List list = [];
      expect(() => list.areSame, throwsStateError);
    });

    test('empty list with explicit type of its elements', () {
      final List<int> list = [];
      expect(() => list.areSame, throwsStateError);
    });
  });

  test('get subs', () {
    final List<dynamic> subs = getSubsets(['a', 'b', 'c', 'd']);
    print(subs);
  });
}
