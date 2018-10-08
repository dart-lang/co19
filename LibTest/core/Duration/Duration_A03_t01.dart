/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Duration({int days: 0, int hours: 0, int minutes: 0,
 * int seconds: 0, int milliseconds: 0, int microseconds: 0, microseconds: 0})
 * All arguments are by default 0.
 * @description Checks that all arguments are by default 0..
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(new Duration(), new Duration(days: 0, hours: 0, minutes: 0,
      seconds: 0, milliseconds: 0, microseconds: 0));
  Expect.equals(new Duration(days: 0), new Duration(hours: 0, minutes: 0,
      seconds: 0, milliseconds: 0, microseconds: 0));
  Expect.equals(new Duration(days: 0, hours: 0), new Duration(minutes: 0,
      seconds: 0, milliseconds: 0, microseconds: 0));
  Expect.equals(new Duration(days: 0, hours: 0, minutes: 0),
      new Duration(seconds: 0, milliseconds: 0));
  Expect.equals(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0),
      new Duration(milliseconds: 0));
  Expect.equals(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0,
      milliseconds: 0), new Duration(microseconds: 0));
}
