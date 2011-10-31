/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get minutes() returns the number of minutes [0...59]. 
 * @description Creates a new Date with various integer minutes values (0..59), and reads the value back.
 * @author hlodvig
 * @reviewer msyabro
 */


main() {
  for(int i = 59; i >= 0; --i){
    check(i);
  }
}

void check(int m) {
  Date date = new Date(2011, 1, 1, 0, m, 0, 0);
  Expect.isTrue(date.minutes is int);
  Expect.equals(m, date.minutes);
}