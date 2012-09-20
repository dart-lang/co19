/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface Duration extends Comparable
 * @description Checks that compareTo() method is implemented correctly.
 * @needsreview Method undocumented 
 * @author rodionov
 * @reviewer msyabro
 */

main() {
  Expect.equals(0, new Duration(days: 1, hours: -4, minutes: 0, seconds: 61, milliseconds: 0).compareTo(new Duration(days: 0, hours: 20, minutes: 1, seconds: 1, milliseconds: 0)));
  Expect.equals(0, new Duration(hours: 1).compareTo(new Duration(seconds: 3600)));

  Expect.equals(1, new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 1000).compareTo(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 999)));
  Expect.equals(1, new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 1001).compareTo(new Duration(days: 0, hours: 0, minutes: 0, seconds: 1, milliseconds: 0)));
  Expect.equals(1, new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 3600001).compareTo(new Duration(days: 0, hours: 1, minutes: 0, seconds: 0, milliseconds: 0)));
  Expect.equals(1, new Duration(days: 0, hours: 0, minutes: 25*60, seconds: 0, milliseconds: 0).compareTo(new Duration(days: 1, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)));

  Expect.equals(-1, new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 999).compareTo(new Duration(days: 0, hours: 0, minutes: 0, seconds: 1, milliseconds: 0)));
  Expect.equals(-1, new Duration(days: 0, hours: 0, minutes: 0, seconds: 1, milliseconds: 0).compareTo(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 1001)));
  Expect.equals(-1, new Duration(days: 0, hours: 1, minutes: 0, seconds: 0, milliseconds: 0).compareTo(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 3600001)));
  Expect.equals(-1, new Duration(days: 1, hours: 0, minutes: 0, seconds: 0, milliseconds: 0).compareTo(new Duration(days: 0, hours: 0, minutes: 25*60, seconds: 0, milliseconds: 0)));
}
