/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list.
 * @description Checks that [value] is added to the end of the list.
 * @author msyabro
 */

main() {
  Queue list = new Queue();
  for (var i = 0; i <= 10000; i++) {
    list.addLast(i);
    Expect.equals(i, list.last());
    Expect.equals(i+1, list.length);
  }
}
