import 'package:flutter_test/flutter_test.dart';
import 'package:overlapping_time/src/extensions/date_time_extension.dart';

void main() {
  group('+', () {
    test('day', () {
      expect(
          DateTime(2021, 3, 4) + const Duration(days: 1), DateTime(2021, 3, 5));
    });

    test('hour', () {
      expect(DateTime(2021, 3, 4, 0) + const Duration(hours: 1),
          DateTime(2021, 3, 4, 1));
    });

    test('minute', () {
      expect(DateTime(2021, 3, 4, 0, 0) + const Duration(minutes: 1),
          DateTime(2021, 3, 4, 0, 1));
    });

    test('second', () {
      expect(DateTime(2021, 3, 4, 0, 0, 0) + const Duration(seconds: 1),
          DateTime(2021, 3, 4, 0, 0, 1));
    });

    test('milliseconds', () {
      expect(DateTime(2021, 3, 4, 0, 0, 0, 0) + const Duration(milliseconds: 1),
          DateTime(2021, 3, 4, 0, 0, 0, 1));
    });

    test('microseconds', () {
      expect(
          DateTime(2021, 3, 4, 0, 0, 0, 0, 0) + const Duration(microseconds: 1),
          DateTime(2021, 3, 4, 0, 0, 0, 0, 1));
    });
  });

  group('-', () {
    test('day', () {
      expect(
          DateTime(2021, 3, 4) - DateTime(2021, 3, 3), const Duration(days: 1));
    });

    test('hour', () {
      expect(DateTime(2021, 3, 4) - DateTime(2021, 3, 3, 23),
          const Duration(hours: 1));
    });

    test('minute', () {
      expect(DateTime(2021, 3, 4) - DateTime(2021, 3, 3, 23, 59),
          const Duration(minutes: 1));
    });

    test('second', () {
      expect(DateTime(2021, 3, 4) - DateTime(2021, 3, 3, 23, 59, 59),
          const Duration(seconds: 1));
    });

    test('milliseconds', () {
      expect(DateTime(2021, 3, 4) - DateTime(2021, 3, 3, 23, 59, 59, 999),
          const Duration(milliseconds: 1));
    });

    test('microseconds', () {
      expect(DateTime(2021, 3, 4) - DateTime(2021, 3, 3, 23, 59, 59, 999, 999),
          const Duration(microseconds: 1));
    });
  });

  group('<', () {
    test('true', () {
      expect(DateTime(2021, 3, 3) < DateTime(2021, 3, 4), true);
    });

    test('false', () {
      expect(DateTime(2021, 3, 4) < DateTime(2021, 3, 3), false);
    });
  });

  group('<=', () {
    group('before', () {
      test(' true', () {
        expect(DateTime(2021, 3, 3) <= DateTime(2021, 3, 4), true);
      });

      test('false', () {
        expect(DateTime(2021, 3, 4) <= DateTime(2021, 3, 3), false);
      });
    });
    group('same', () {
      test('true', () {
        expect(DateTime(2021, 3, 4) <= DateTime(2021, 3, 4), true);
      });
    });
  });

  group('>', () {
    test('true', () {
      expect(DateTime(2021, 3, 4) > DateTime(2021, 3, 3), true);
    });

    test('false', () {
      expect(DateTime(2021, 3, 3) > DateTime(2021, 3, 4), false);
    });
  });

  group('>=', () {
    group('after', () {
      test(' true', () {
        expect(DateTime(2021, 3, 4) >= DateTime(2021, 3, 3), true);
      });

      test('false', () {
        expect(DateTime(2021, 3, 3) >= DateTime(2021, 3, 4), false);
      });
    });
    group('same', () {
      test('true', () {
        expect(DateTime(2021, 3, 4) >= DateTime(2021, 3, 4), true);
      });
    });
  });
}
