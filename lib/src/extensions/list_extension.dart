import 'dart:collection';

extension ListExtension<E> on List<E> {
  /// De-duplicates this collection.
  List<E> dedupe() => toSet().toList();

  /// Returns `true` if there are no duplicated elements in this collection.
  bool get hasUniqueElements {
    final HashMap<E, bool> hashMap = HashMap();

    for (final E element in this) {
      if (hashMap.containsKey(element)) {
        return false;
      }
      hashMap[element] = true;
    }

    return true;
  }

  /// Returns a list of types of elements in this collection.
  List<Type> getElementsTypes() {
    final Map<Type, bool> hashMap = {};

    for (final E element in this) {
      final Type type = element.runtimeType;
      hashMap[type] = true;
    }

    final List<Type> types = hashMap.keys.toList();
    return types;
  }

  /// Returns `true` if all elements in this collections are the same.
  bool get areSame {
    if (isEmpty) {
      throw StateError('No elements to compare');
    }

    return every((E element) => element == first);
  }
}
