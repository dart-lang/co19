/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented: passing null in place of either argument results in
 *            a NullPointerException
 * @description Tries to pass null as an argument, expects a NullPointerException.
 * @author akuznecov
 * @reviewer rodionov
 * @reviewer msyabro
 * @needsreview Undocumented
 */

main() {
  check(null, 0, 0, 0, 0);
  check(0, null, 0, 0, 0);
  check(0, 0, null, 0, 0);
  check(0, 0, 0, null, 0);
  check(0, 0, 0, 0, null);
  check(null, null, null, null, null);
}

void check(int d, int h, int m, int s, int ms) {
  try {
    new Duration(days: d, hours: h, minutes: m, seconds: s, milliseconds: ms);
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(e) {
  }
}
