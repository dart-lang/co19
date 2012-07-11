/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a new Date instance with current date time value
 * in the local time zone.
 * @description Checks that the dates constructed by [:Date.now():] increase all the time.
 * @author msyabro
 * @reviewer pagolubev
 */

main(){
  Date start = new Date.now();
  Date prev = start;
  for(int i = 0; i < 100000; i++) {
    Date next = new Date.now();
    Expect.isTrue(prev.compareTo(next) <= 0);
    prev = next;
  }
  Expect.isTrue(start.compareTo(new Date.now()) < 0);
}
