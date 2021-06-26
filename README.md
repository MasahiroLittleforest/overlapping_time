# overlapping_time
A package for finding overlappings between given time ranges.


## Usage
The type of time ranges to compare must be either `TimeOfDayRange`, which is created for this package, or `DateTimeRange`, which is provided by Flutter.

- TimeOfDayRange
  ```dart
  import 'package:overlapping_time/overlapping_time.dart';

  void main() {
    // 01:00 - 04:00
    final TimeOfDayRange rangeA = TimeOfDayRange(
      start: TimeOfDayRange(hour: 1, minute: 0),
      end: TimeOfDayRange(hour: 4, minute: 0),
    );
    // 02:00 - 05:00
    final TimeOfDayRange rangeB = TimeOfDayRange(
      start: TimeOfDayRange(hour: 2, minute: 0),
      end: TimeOfDayRange(hour: 5, minute: 0),
    );
    // 03:00 - 06:00
    final TimeOfDayRange rangeC = TimeOfDayRange(
      start: TimeOfDayRange(hour: 3, minute: 0),
      end: TimeOfDayRange(hour: 6, minute: 0),
    );

    final List ranges = [rangeA, rangeB, rangeC];

    final Map<int, List<ComparingResult>> searchResults = findOverlap(ranges: ranges);

    // Extract range that all 3 ranges overlap with each other
    final TimeOfDayRange overlappingRange = searchResults[3].first.overlappingRange;
    print(overlappingRange);
  }
  ```
  Output
  ```
   TimeOfDay(3:00) - TimeOfDay(04:00)
  ```
  

- DateTimeRange
  ```dart
  import 'package:overlapping_time/overlapping_time.dart';

  void main() {
    // 2020-1-1 01:00 - 2020-1-1 04:00
    final DateTimeRange rangeA = DateTimeRange(
      start: DateTime(2020, 1, 1, 1, 0),
      end: DateTime(2020, 1, 1, 4, 0),
    );
    // 2020-1-1 02:00 - 2020-1-1 05:00
    final DateTimeRange rangeB = DateTimeRange(
      start: DateTime(2020, 1, 1, 2, 0),
      end: DateTime(2020, 1, 1, 5, 0),
    );
    // 2020-1-1 03:00 - 2020-1-1 06:00
    final DateTimeRange rangeC = DateTimeRange(
      start: DateTime(2020, 1, 1, 3, 0),
      end: DateTime(2020, 1, 1, 6, 0),
    );

    final List ranges = [rangeA, rangeB, rangeC];

    final Map<int, List<ComparingResult>> searchResults = findOverlap(items: ranges);

    // Extract range that all 3 ranges overlap with each other
    final DateTimeRange overlappingRange = searchResults[3].first.overlappingRange;
    print(overlappingRange);
  }
  ```
  Output
  ```
  2020-01-01 03:00:00.000 - 2020-01-01 04:00:00.000
  ```


## Buy me a coffee
Coffee keeps me on fire :)

<a href="https://www.buymeacoffee.com/littleforest" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>