/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get milliseconds() returns the number of seconds [0...999]. 
 * @description Creates a new Date with various integer milliseconds values (0..999), and reads the value back.
 * @author hlodvig
 * @reviewer msyabro
 */


main() {
  for(int i = 999; i >= 0; --i){
    check(i);
  }
}

void check(int ms) {
  Date date = new Date(2011, 1, 1, 0, 0, 0, ms);
  Expect.isTrue(date.millisecond is int);
  Expect.equals(ms, date.millisecond);
}
