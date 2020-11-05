import 'package:overlapping_time/overlapping_time.dart';
import 'package:flutter/material.dart';

void main() {
  final DateTimeRange rangeA = DateTimeRange(
    start: DateTime(2020, 1, 1, 1, 0),
    end: DateTime(2020, 1, 1, 4, 0),
  );
  final DateTimeRange rangeB = DateTimeRange(
    start: DateTime(2020, 1, 1, 2, 0),
    end: DateTime(2020, 1, 1, 5, 0),
  );
  final DateTimeRange rangeC = DateTimeRange(
    start: DateTime(2020, 1, 1, 3, 0),
    end: DateTime(2020, 1, 1, 6, 0),
  );

  final List ranges = [rangeA, rangeB, rangeC];

  final Map<int, List<ComparingResult>> searchResults =
      findOverlap(ranges: ranges);

  for (final int i in searchResults.keys) {
    print('------------------------------------------------');
    print('|  Overlapping ranges with $i of given ranges   |');
    print('------------------------------------------------');
    print('');
    for (final ComparingResult r in searchResults[i]) {
      print('compared ranges:');
      for (final cr in r.comparedRanges) {
        print('- $cr');
      }
      print('');
      print('overlapping range:');
      print('- ${r.overlappingRange}');
      print('---------------------------------------------');
    }
    print('');
  }
}
