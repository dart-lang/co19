/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int millisecond
 * Returns the millisecond into the second 0...999.
 * @description Creates a new DateTime with various integer milliseconds values (0..999),
 * and reads the value back.
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  for(int i = 999; i >= 0; --i){
    check(i);
  }
}

void check(int ms) {
  DateTime date = new DateTime(2011, 1, 1, 0, 0, 0, ms);
  Expect.isTrue(date.millisecond is int);
  Expect.equals(ms, date.millisecond);
}
