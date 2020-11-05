import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:overlapping_time/overlapping_time.dart';

/// The result of searching overlapping range.
@immutable
class ComparingResult {
  ComparingResult({
    @required this.comparedRanges,
    @required this.overlappingRange,
  })  : assert(comparedRanges != null),
        assert(overlappingRange != null),
        assert(
          comparedRanges.isNotEmpty,
          '"comparedRanges" shoudn\'t be empty.',
        ),
        assert((comparedRanges.every((element) => element is TimeOfDayRange) &&
                overlappingRange is TimeOfDayRange) ||
            (comparedRanges.every((element) => element is DateTimeRange) &&
                overlappingRange is DateTimeRange));

  /// All compared ranges to find [overlappingRange].
  ///
  /// Elements of [comparedRanges] must be either [TimeOfDayRange] or [DateTimeRange].
  final List<dynamic> comparedRanges;

  /// A range that all of [comparedRanges] overlap.
  ///
  /// [overlappingRange] must be either [TimeOfDayRange] or [DateTimeRange].
  final dynamic overlappingRange;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ComparingResult &&
        listEquals(other.comparedRanges, comparedRanges) &&
        (other.overlappingRange == overlappingRange);
  }

  @override
  int get hashCode => comparedRanges.hashCode ^ overlappingRange.hashCode;

  @override
  String toString() => '{$comparedRanges: $overlappingRange}';
}
