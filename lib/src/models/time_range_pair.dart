import 'package:flutter/material.dart';

/// A pair of time ranges.
@immutable
abstract class TimeRangePair {
  const TimeRangePair({
    @required this.rangeA,
    @required this.rangeB,
  })  : assert(rangeA != null),
        assert(rangeB != null);

  final dynamic rangeA;
  final dynamic rangeB;

  dynamic getOverlappingRange();

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return (other is TimeRangePair) &&
        (other.rangeA == rangeA) &&
        (other.rangeB == rangeB);
  }

  @override
  int get hashCode => super.hashCode;
}
