/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Duration({int days: 0, int hours: 0, int minutes: 0,
 * int seconds: 0, int milliseconds: 0, int microseconds: 0, microseconds: 0})
 * Individual parts can be larger than the next-bigger unit. For example, hours
 * can be greater than 23.
 * @description Checks that individual parts can be larger than the next-bigger
 * unit.
 * @author sgrekhov
 */
import "../../../Utils/expect.dart";

main() {
  Duration d1 = new Duration(hours: 25, minutes: 120, seconds: 61,
      milliseconds: 1001, microseconds: 1001);
  Duration d2 = new Duration(days: 1, hours: 3, minutes: 1, seconds: 2,
      milliseconds: 2, microseconds: 1);
  Expect.equals(d2, d1);
}
