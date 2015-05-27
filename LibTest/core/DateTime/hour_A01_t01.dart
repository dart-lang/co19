/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int hour
 * Returns the hour into the day 0..23.
 * @description Creates a new DateTime with various integer hours values (0..23),
 * and reads the value back.
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  for(int i = 23; i >= 0; --i){
    check(i);
  }
}

void check(int h) {
  DateTime date = new DateTime(2011, 1, 1, h, 0, 0, 0);
  Expect.isTrue(date.hour is int);
  Expect.equals(h, date.hour);
}
