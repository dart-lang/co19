/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int microsecond
 * Returns the the microsecond 0...999
 * @description Creates a new DateTime with various integer microseconds values
 * (0..999) and reads the value back.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  for(int i = 999; i >= 0; --i) {
    check(i);
  }
}

void check(int us) {
  DateTime date = new DateTime(2011, 1, 1, 0, 0, 0, 0, us);
  Expect.isTrue(date.microsecond is int);
  Expect.equals(us, date.microsecond);
}
