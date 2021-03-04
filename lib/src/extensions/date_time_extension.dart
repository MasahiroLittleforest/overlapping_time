extension DateTimeExtension on DateTime {
  DateTime operator +(Duration duration) => add(duration);

  Duration operator -(DateTime other) => difference(other);

  bool operator <(DateTime other) => compareTo(other) < 0;

  bool operator <=(DateTime other) => compareTo(other) <= 0;

  bool operator >(DateTime other) => compareTo(other) > 0;

  bool operator >=(DateTime other) => compareTo(other) >= 0;
}
