import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:overlapping_time/overlapping_time.dart';

import './extensions/list_extension.dart';

/// Finds overlapping range between subsets of given items.
///
/// - [ranges]
///   - must consist of unique elements.
///   - must be list of elements with type [TimeOfDayRange] or [DateTimeRange].
///
/// - [allowTouchingRanges]
///   - whether you want to consider touching (not really overlapping) ranges to have overlap with zero time or not.
///
/// - [maxOverlappingItemsNum]
///   - is maximum number of ranges overlapping each other that you want to find.
///   - must be length of [ranges] with no duplication or lower.
///
/// - [minOverlappingItemsNum]
///   - is minimum number of ranges overlapping each other that you want to find.
///   - must be 2 or higher.
///
/// The results of comparing in each subset with overlap will be returned as [ComparingResult].
Map<int, List<ComparingResult>> findOverlap({
  @required List<dynamic> ranges,
  bool allowTouchingRanges = false,
  int maxOverlappingItemsNum,
  int minOverlappingItemsNum = 2,
}) {
  if (ranges == null) {
    throw ArgumentError.notNull('ranges');
  }

  if (ranges.isEmpty) {
    return {};
  }

  final List<Type> elementsTypes = ranges.getElementsTypes();

  if (!elementsTypes.areSame) {
    throw ArgumentError.value(
      ranges,
      'ranges',
      'must have only elements with single type.',
    );
  }

  final Type elementsType = elementsTypes.first;

  // Throws an error if elements of "ranges" is neither TimeOfDayRange nor DateTimeRange
  if (!(elementsType == TimeOfDayRange || elementsType == DateTimeRange)) {
    throw ArgumentError.value(
      ranges,
      'ranges',
      'must be either List<TimeOfDayRange> or List<DateTimeRange>.',
    );
  }

  if (maxOverlappingItemsNum != null) {
    if (maxOverlappingItemsNum > ranges.length) {
      throw ArgumentError.value(
        maxOverlappingItemsNum,
        'maxOverlappingItemsNum',
        'must be length of "items" or lower.',
      );
    }
  }

  if (minOverlappingItemsNum != null) {
    if (minOverlappingItemsNum < 2) {
      throw ArgumentError.value(
        minOverlappingItemsNum,
        'minOverlappingItemsNum',
        'must be 2 or higher.',
      );
    }
  }

  final List<dynamic> dedupedItems = ranges.dedupe();

  if (dedupedItems.length < 2) {
    throw Exception('dedupedItems.length must be 2 or higher.');
  }

  maxOverlappingItemsNum ??= dedupedItems.length;

  // init foundOverlapsMap
  final Map<int, List<ComparingResult>> foundOverlapsMap = {};
  for (int i = minOverlappingItemsNum; i <= maxOverlappingItemsNum; i++) {
    foundOverlapsMap[i] = [];
  }

  final List<List<dynamic>> subsets = getSubsets(dedupedItems);

  for (int i = minOverlappingItemsNum; i <= maxOverlappingItemsNum; i++) {
    final List<List<dynamic>> subs =
        subsets.where((subset) => subset.length == i).toList();

    for (final List<dynamic> sub in subs) {
      List<dynamic> comparedRanges;
      dynamic overlappingRange;

      if (i == 2) {
        if (elementsType == TimeOfDayRange) {
          overlappingRange = TimeOfDayRangePair(
            a: sub.first as TimeOfDayRange,
            b: sub.last as TimeOfDayRange,
          ).getOverlappingRange(allowTouchingRanges: allowTouchingRanges);
        } else if (elementsType == DateTimeRange) {
          overlappingRange = DateTimeRangePair(
            a: sub.first as DateTimeRange,
            b: sub.last as DateTimeRange,
          ).getOverlappingRange(allowTouchingRanges: allowTouchingRanges);
        }

        if (overlappingRange == null) {
          // skip to next pair
          continue;
        }

        comparedRanges = sub;
      }

      if (i > 2) {
        final int previousIndex = i - 1;
        final List<dynamic> a = sub.sublist(0, previousIndex);

        final dynamic b = sub.last;

        // If same ranges as "a" has been done, use result of it
        final ComparingResult alreadyFoundResult =
            foundOverlapsMap[previousIndex].firstWhere(
          (ComparingResult r) => listEquals(r.comparedRanges, a),
          orElse: () => null,
        );

        if (alreadyFoundResult == null) {
          // skip to next pair
          continue;
        }

        if (elementsType == TimeOfDayRange) {
          overlappingRange = TimeOfDayRangePair(
            a: sub.first as TimeOfDayRange,
            b: sub.last as TimeOfDayRange,
          ).getOverlappingRange(allowTouchingRanges: allowTouchingRanges);
        } else if (elementsType == DateTimeRange) {
          overlappingRange = DateTimeRangePair(
            a: sub.first as DateTimeRange,
            b: sub.last as DateTimeRange,
          ).getOverlappingRange(allowTouchingRanges: allowTouchingRanges);
        }

        if (overlappingRange == null) {
          // skip to next pair
          continue;
        }

        comparedRanges = [...a, b];
      }

      final ComparingResult result = ComparingResult(
        comparedRanges: comparedRanges,
        overlappingRange: overlappingRange,
      );

      foundOverlapsMap[i].add(result);
    }
  }

  return foundOverlapsMap;
}
