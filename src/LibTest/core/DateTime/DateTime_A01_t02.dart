/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory DateTime(int year, [int month = 1, int day = 1, int hour = 0,
 * int minute = 0, int second = 0, int millisecond = 0])
 * Constructs a DateTime instance based on the individual parts.
 * The date is in the local time zone. month and day are one-based. 
 * @description Tries to pass null for each argument.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer msyabro
 * @needsreview
 */
import "../../../Utils/expect.dart";

void check(y, m, d, h, min, sec, ms, field) {
  try {
    new DateTime(y, m, d, h, min, sec, ms);
    Expect.fail("Error expected with the passed null value of the $field");
  } on Error catch(ok) {}
}

main(){
  check(null, 1, 1, 1, 1, 1, 1, "year");
  check(1, null, 1, 1, 1, 1, 1, "month");
  check(1, 1, null, 1, 1, 1, 1, "day");
  check(1, 1, 1, null, 1, 1, 1, "hours");
  check(1, 1, 1, 1, null, 1, 1, "minutes");
  check(1, 1, 1, 1, 1, null, 1, "seconds");
  check(1, 1, 1, 1, 1, 1, null, "milliseconds");
}
