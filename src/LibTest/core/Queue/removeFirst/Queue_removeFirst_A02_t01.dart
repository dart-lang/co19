/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an exception if the list is empty.
 * @description Checks that exception is thrown if the list is empty.
 * @author msyabro
 * @needsreview what type of exception
 */


main() {
  Queue list = new Queue();
  try {
    list.removeFirst();
    Expect.fail("Exception is expected");
  } catch(Object e) {}
  
  list.addLast(1);
  list.addLast(2);
  list.clear();

  try {
    list.removeFirst();
    Expect.fail("Exception is expected");
  } catch(Object e) {}
}
