import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  int inMinutes() => (hour * 60) + minute;
}
