import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlapping_time/overlapping_time.dart';

void main() {
  group('TimeOfDayRange', () {
    test('"findOverlap" with List<TimeOfDayRange>: 2', () {
      expect(
          findOverlap(ranges: const [
            TimeOfDayRange(
              start: TimeOfDay(hour: 1, minute: 0),
              end: TimeOfDay(hour: 3, minute: 0),
            ),
            TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 4, minute: 0),
            ),
          ]),
          {
            2: [
              ComparingResult(
                comparedRanges: const [
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 1, minute: 0),
                    end: TimeOfDay(hour: 3, minute: 0),
                  ),
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 2, minute: 0),
                    end: TimeOfDay(hour: 4, minute: 0),
                  ),
                ],
                overlappingRange: const TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 3, minute: 0),
                ),
              ),
            ]
          });
    });
    test('"findOverlap" with List<TimeOfDayRange>: 4', () {
      expect(
        findOverlap(ranges: const [
          TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 5, minute: 0),
          ),
          TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 6, minute: 0),
          ),
          TimeOfDayRange(
            start: TimeOfDay(hour: 3, minute: 0),
            end: TimeOfDay(hour: 7, minute: 0),
          ),
          TimeOfDayRange(
            start: TimeOfDay(hour: 4, minute: 0),
            end: TimeOfDay(hour: 8, minute: 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 3, minute: 0),
                  end: TimeOfDay(hour: 7, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 3, minute: 0),
                  end: TimeOfDay(hour: 7, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 8, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 8, minute: 0),
                )
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 3, minute: 0),
                  end: TimeOfDay(hour: 7, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 8, minute: 0),
                )
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
            ),
          ],
          3: [
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 3, minute: 0),
                  end: TimeOfDay(hour: 7, minute: 0),
                )
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 8, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 3, minute: 0),
                  end: TimeOfDay(hour: 7, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 8, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
            ),
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 3, minute: 0),
                  end: TimeOfDay(hour: 7, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 8, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
            ),
          ],
          4: [
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 3, minute: 0),
                  end: TimeOfDay(hour: 7, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 8, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
            ),
          ],
        },
      );
    });
  });

  group('DateTimeRange', () {
    test('"findOverlap" with List<DateTimeRange>: 2', () {
      expect(
        findOverlap(ranges: [
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 1, 0),
                  end: DateTime(2020, 1, 1, 3, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 4, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 2, 0),
                end: DateTime(2020, 1, 1, 3, 0),
              ),
            ),
          ]
        },
      );
    });
    test('"findOverlap" with List<DateTimeRange>: 3', () {
      expect(
        findOverlap(ranges: [
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 4, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 5, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 3, 0),
            end: DateTime(2020, 1, 1, 6, 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 1, 0),
                  end: DateTime(2020, 1, 1, 4, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 2, 0),
                end: DateTime(2020, 1, 1, 4, 0),
              ),
            ),
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 1, 0),
                  end: DateTime(2020, 1, 1, 4, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 3, 0),
                  end: DateTime(2020, 1, 1, 6, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 3, 0),
                end: DateTime(2020, 1, 1, 4, 0),
              ),
            ),
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 3, 0),
                  end: DateTime(2020, 1, 1, 6, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 3, 0),
                end: DateTime(2020, 1, 1, 5, 0),
              ),
            ),
          ],
          3: [
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 1, 0),
                  end: DateTime(2020, 1, 1, 4, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 3, 0),
                  end: DateTime(2020, 1, 1, 6, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 3, 0),
                end: DateTime(2020, 1, 1, 4, 0),
              ),
            ),
          ],
        },
      );

      expect(
        findOverlap(ranges: [
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 5, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 4, 0),
            end: DateTime(2020, 1, 1, 7, 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 1, 0),
                  end: DateTime(2020, 1, 1, 3, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 2, 0),
                end: DateTime(2020, 1, 1, 3, 0),
              ),
            ),
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 4, 0),
                  end: DateTime(2020, 1, 1, 7, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 4, 0),
                end: DateTime(2020, 1, 1, 5, 0),
              ),
            ),
          ],
          3: [],
        },
      );
    });
  });

  group('same ranges', () {
    test('TimeOfDayRange', () {
      expect(
        findOverlap(ranges: [
          const TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
          const TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 3, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 3, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 3, minute: 0),
              ),
            )
          ],
        },
      );
      expect(
        findOverlap(ranges: const [
          TimeOfDayRange(
            start: TimeOfDay(hour: 2, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
          TimeOfDayRange(
            start: TimeOfDay(hour: 1, minute: 0),
            end: TimeOfDay(hour: 3, minute: 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: const [
                TimeOfDayRange(
                  start: TimeOfDay(hour: 2, minute: 0),
                  end: TimeOfDay(hour: 3, minute: 0),
                ),
                TimeOfDayRange(
                  start: TimeOfDay(hour: 1, minute: 0),
                  end: TimeOfDay(hour: 3, minute: 0),
                ),
              ],
              overlappingRange: const TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 3, minute: 0),
              ),
            )
          ],
        },
      );
    });
    test('DateTimeRange', () {
      expect(
        findOverlap(ranges: [
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 1, 0),
                  end: DateTime(2020, 1, 1, 3, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 3, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 2, 0),
                end: DateTime(2020, 1, 1, 3, 0),
              ),
            ),
          ],
        },
      );
      expect(
        findOverlap(ranges: [
          DateTimeRange(
            start: DateTime(2020, 1, 1, 2, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
          DateTimeRange(
            start: DateTime(2020, 1, 1, 1, 0),
            end: DateTime(2020, 1, 1, 3, 0),
          ),
        ]),
        {
          2: [
            ComparingResult(
              comparedRanges: [
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 2, 0),
                  end: DateTime(2020, 1, 1, 3, 0),
                ),
                DateTimeRange(
                  start: DateTime(2020, 1, 1, 1, 0),
                  end: DateTime(2020, 1, 1, 3, 0),
                ),
              ],
              overlappingRange: DateTimeRange(
                start: DateTime(2020, 1, 1, 2, 0),
                end: DateTime(2020, 1, 1, 3, 0),
              ),
            ),
          ],
        },
      );
    });
  });

  group('includeTouchingRanges: true', () {
    test('TimeOfDayRange', () {
      expect(
          findOverlap(
            allowTouchingRanges: true,
            ranges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 5, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
            ],
          ),
          {
            2: [
              ComparingResult(
                comparedRanges: const [
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 1, minute: 0),
                    end: TimeOfDay(hour: 5, minute: 0),
                  ),
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 5, minute: 0),
                    end: TimeOfDay(hour: 7, minute: 0),
                  ),
                ],
                overlappingRange: const TimeOfDayRange(
                  start: TimeOfDay(hour: 5, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
              ),
              ComparingResult(
                comparedRanges: const [
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 1, minute: 0),
                    end: TimeOfDay(hour: 5, minute: 0),
                  ),
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 4, minute: 0),
                    end: TimeOfDay(hour: 6, minute: 0),
                  ),
                ],
                overlappingRange: const TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
              ),
              ComparingResult(
                comparedRanges: const [
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 5, minute: 0),
                    end: TimeOfDay(hour: 7, minute: 0),
                  ),
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 4, minute: 0),
                    end: TimeOfDay(hour: 6, minute: 0),
                  ),
                ],
                overlappingRange: const TimeOfDayRange(
                  start: TimeOfDay(hour: 5, minute: 0),
                  end: TimeOfDay(hour: 6, minute: 0),
                ),
              ),
            ],
            3: [
              ComparingResult(
                comparedRanges: const [
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 1, minute: 0),
                    end: TimeOfDay(hour: 5, minute: 0),
                  ),
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 5, minute: 0),
                    end: TimeOfDay(hour: 7, minute: 0),
                  ),
                  TimeOfDayRange(
                    start: TimeOfDay(hour: 4, minute: 0),
                    end: TimeOfDay(hour: 6, minute: 0),
                  ),
                ],
                overlappingRange: const TimeOfDayRange(
                  start: TimeOfDay(hour: 4, minute: 0),
                  end: TimeOfDay(hour: 5, minute: 0),
                ),
              ),
            ],
          });
    });

    test('DateTimeRange', () {
      expect(
          findOverlap(
            allowTouchingRanges: true,
            ranges: [
              DateTimeRange(
                start: DateTime(2020, 1, 1, 1, 0),
                end: DateTime(2020, 1, 1, 5, 0),
              ),
              DateTimeRange(
                start: DateTime(2020, 1, 1, 5, 0),
                end: DateTime(2020, 1, 1, 7, 0),
              ),
              DateTimeRange(
                start: DateTime(2020, 1, 1, 4, 0),
                end: DateTime(2020, 1, 1, 6, 0),
              ),
            ],
          ),
          {
            2: [
              ComparingResult(
                comparedRanges: [
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 1, 0),
                    end: DateTime(2020, 1, 1, 5, 0),
                  ),
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 5, 0),
                    end: DateTime(2020, 1, 1, 7, 0),
                  ),
                ],
                overlappingRange: DateTimeRange(
                  start: DateTime(2020, 1, 1, 5, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
              ),
              ComparingResult(
                comparedRanges: [
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 1, 0),
                    end: DateTime(2020, 1, 1, 5, 0),
                  ),
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 4, 0),
                    end: DateTime(2020, 1, 1, 6, 0),
                  ),
                ],
                overlappingRange: DateTimeRange(
                  start: DateTime(2020, 1, 1, 4, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
              ),
              ComparingResult(
                comparedRanges: [
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 5, 0),
                    end: DateTime(2020, 1, 1, 7, 0),
                  ),
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 4, 0),
                    end: DateTime(2020, 1, 1, 6, 0),
                  ),
                ],
                overlappingRange: DateTimeRange(
                  start: DateTime(2020, 1, 1, 5, 0),
                  end: DateTime(2020, 1, 1, 6, 0),
                ),
              ),
            ],
            3: [
              ComparingResult(
                comparedRanges: [
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 1, 0),
                    end: DateTime(2020, 1, 1, 5, 0),
                  ),
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 5, 0),
                    end: DateTime(2020, 1, 1, 7, 0),
                  ),
                  DateTimeRange(
                    start: DateTime(2020, 1, 1, 4, 0),
                    end: DateTime(2020, 1, 1, 6, 0),
                  ),
                ],
                overlappingRange: DateTimeRange(
                  start: DateTime(2020, 1, 1, 4, 0),
                  end: DateTime(2020, 1, 1, 5, 0),
                ),
              ),
            ],
          });
    });
  });

  test('max < items.length', () {
    expect(
      findOverlap(ranges: const [
        TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 5, minute: 0),
        ),
        TimeOfDayRange(
          start: TimeOfDay(hour: 2, minute: 0),
          end: TimeOfDay(hour: 6, minute: 0),
        ),
        TimeOfDayRange(
          start: TimeOfDay(hour: 3, minute: 0),
          end: TimeOfDay(hour: 7, minute: 0),
        ),
        TimeOfDayRange(
          start: TimeOfDay(hour: 4, minute: 0),
          end: TimeOfDay(hour: 8, minute: 0),
        ),
      ], maxOverlappingItemsNum: 3),
      {
        2: [
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 2, minute: 0),
              end: TimeOfDay(hour: 5, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 3, minute: 0),
              end: TimeOfDay(hour: 5, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 3, minute: 0),
              end: TimeOfDay(hour: 6, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 8, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 4, minute: 0),
              end: TimeOfDay(hour: 5, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 8, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 4, minute: 0),
              end: TimeOfDay(hour: 6, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 8, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 4, minute: 0),
              end: TimeOfDay(hour: 7, minute: 0),
            ),
          ),
        ],
        3: [
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 3, minute: 0),
              end: TimeOfDay(hour: 5, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 8, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 4, minute: 0),
              end: TimeOfDay(hour: 5, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 5, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 8, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 4, minute: 0),
              end: TimeOfDay(hour: 5, minute: 0),
            ),
          ),
          ComparingResult(
            comparedRanges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 2, minute: 0),
                end: TimeOfDay(hour: 6, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 3, minute: 0),
                end: TimeOfDay(hour: 7, minute: 0),
              ),
              TimeOfDayRange(
                start: TimeOfDay(hour: 4, minute: 0),
                end: TimeOfDay(hour: 8, minute: 0),
              ),
            ],
            overlappingRange: const TimeOfDayRange(
              start: TimeOfDay(hour: 4, minute: 0),
              end: TimeOfDay(hour: 6, minute: 0),
            ),
          ),
        ],
      },
    );
  });

  test('invalid arguments', () {
    expect(
      () => findOverlap(ranges: null),
      throwsArgumentError,
    );
    expect(
      findOverlap(ranges: []),
      {},
    );
    expect(
        () => findOverlap(ranges: const [
              TimeOfDayRange(
                start: TimeOfDay(hour: 1, minute: 0),
                end: TimeOfDay(hour: 2, minute: 0),
              )
            ]),
        throwsException);
    expect(
      () => findOverlap(ranges: [
        const TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 2, minute: 0),
        ),
        DateTimeRange(
          start: DateTime(2020, 1, 1, 2, 0),
          end: DateTime(2020, 1, 1, 3, 0),
        )
      ]),
      throwsArgumentError,
    );
    expect(
      () => findOverlap(ranges: [1, '2']),
      throwsArgumentError,
    );
    expect(
      () => findOverlap(ranges: [
        const TimeOfDayRange(
          start: TimeOfDay(hour: 1, minute: 0),
          end: TimeOfDay(hour: 2, minute: 0),
        ),
        1
      ]),
      throwsArgumentError,
    );
  });

  test('inappropriate key for result map to access', () {
    final Map m = findOverlap(ranges: const [
      TimeOfDayRange(
        start: TimeOfDay(hour: 1, minute: 0),
        end: TimeOfDay(hour: 5, minute: 0),
      ),
      TimeOfDayRange(
        start: TimeOfDay(hour: 2, minute: 0),
        end: TimeOfDay(hour: 6, minute: 0),
      ),
      TimeOfDayRange(
        start: TimeOfDay(hour: 3, minute: 0),
        end: TimeOfDay(hour: 7, minute: 0),
      ),
      TimeOfDayRange(
        start: TimeOfDay(hour: 4, minute: 0),
        end: TimeOfDay(hour: 8, minute: 0),
      ),
    ], maxOverlappingItemsNum: 3);
    expect(
      m[4],
      null,
    );
  });
}
