/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds) 
 * constructs a [DateTime] instance based on the individual parts
 * @description Tries to pass null for each argument.
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview
 */

void check(y, m, d, h, min, sec, ms) {
  try {
    new DateTime(y, m, d, h, min, sec, ms);
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
}

main(){
  check(null, 1, 1, 1, 1, 1, 1);
  check(1, null, 1, 1, 1, 1, 1);
  check(1, 1, null, 1, 1, 1, 1);
  check(1, 1, 1, null, 1, 1, 1);
  check(1, 1, 1, 1, null, 1, 1);
  check(1, 1, 1, 1, 1, null, 1);
  check(1, 1, 1, 1, 1, 1, null);
}
