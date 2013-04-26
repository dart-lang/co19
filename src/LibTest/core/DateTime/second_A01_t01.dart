/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int second
 * Returns the second into the minute 0...59.
 * @description Creates a new DateTime with various integer seconds values (0..59),
 * and reads the value back.
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  for(int i = 59; i >= 0; --i){
    check(i);
  }
}

void check(int s) {
  DateTime date = new DateTime(2011, 1, 1, 0, 0, s, 0);
  Expect.isTrue(date.second is int);
  Expect.equals(s, date.second);
}
