/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration abs()
 * Returns a new Duration representing the absolute value of this Duration.
 * The returned Duration has the same length as this one, but is always positive
 * @description Checks that a Duration instance really is Comparable
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Duration d1 = new Duration(days: -1, hours: -1, minutes: -1, seconds: -1,
      milliseconds: -1);
  Duration d2 = d1.abs();
  Expect.equals(-d1.inDays, d2.inDays);
  Expect.equals(-d1.inHours, d2.inHours);
  Expect.equals(-d1.inMinutes, d2.inMinutes);
  Expect.equals(-d1.inSeconds, d2.inSeconds);
  Expect.equals(-d1.inMilliseconds, d2.inMilliseconds);
}
