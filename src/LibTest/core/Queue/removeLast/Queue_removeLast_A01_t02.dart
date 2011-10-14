/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes and returns the last element of the list.
 * @description Checks removal of equal values.
 * @author msyabro
 */


main() {
  Queue list = new Queue();
  list.addLast(1);
  list.addLast(1);
  list.addLast(1);

  Expect.isTrue(list.length == 3);

  Expect.isTrue(list.removeLast() == 1);
  Expect.isTrue(list.length == 2);
  Expect.isTrue(list.last() == 1);

  Expect.isTrue(list.removeLast() == 1);
  Expect.isTrue(list.length == 1);
  Expect.isTrue(list.last() == 1);

  Expect.isTrue(list.removeLast() == 1);
  Expect.isTrue(list.length == 0);
}
