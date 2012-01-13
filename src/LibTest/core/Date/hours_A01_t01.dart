/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get hours() returns the number of hours [0..23]. 
 * @description Creates a new Date with various integer hours values (0..23), and reads the value back.
 * @author hlodvig
 * @reviewer msyabro
 */


main() {
  for(int i = 23; i >= 0; --i){
    check(i);
  }
}

void check(int h) {
  Date date = new Date(2011, 1, 1, h, 0, 0, 0);
  Expect.isTrue(date.hours is int);
  Expect.equals(h, date.hours);
}