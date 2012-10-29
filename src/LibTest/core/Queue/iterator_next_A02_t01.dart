/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [StateError] if no element is left.
 * @description Checks that exception is thrown if no element is left.
 * @author msyabro
 * @reviewer varlax
 */

main() {
  Queue list = new Queue();
  try {
    list.iterator().next();
    Expect.fail("StateError is expected");
  } on StateError catch(ok) { }


  list.addLast(1);
  Iterator it = list.iterator();
  it.next();
  try {
    it.next();
    Expect.fail("StateError is expected");
  } on StateError catch(ok) { }
}
