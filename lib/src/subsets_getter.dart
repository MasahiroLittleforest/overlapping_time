import 'package:trotter/trotter.dart';

/// Returns all subsets of given [items].
///
/// _Example_
/// ```
/// var subsets = getSubsets(['a', 'b', 'c', 'd']);
/// print(subsets().toList());
/// ```
/// _Output_
/// `[[], [a], [b], [a, b], [c], [a, c], [b, c], [a, b, c], [d], [a, d], [b, d], [a, b, d], [c, d], [a, c, d], [b, c, d], [a, b, c, d]]`
List<List<dynamic>> getSubsets(List<dynamic> items) {
  final Subsets<dynamic> subsets = Subsets(items);
  return subsets().toList();
}
