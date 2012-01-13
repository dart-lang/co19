/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [NoMoreElementsException] if no element is left.
 * @description Checks that exception is thrown if no element is left.
 * @author msyabro
 * @reviewer varlax
 */

main() {
  Queue list = new Queue();
  try {
    list.iterator().next();
    Expect.fail("NoMoreElementsException is expected");
  } catch( NoMoreElementsException ok ) { }


  list.addLast(1);
  Iterator it = list.iterator();
  it.next();
  try {
    it.next();
    Expect.fail("NoMoreElementsException is expected");
  } catch( NoMoreElementsException ok ) { }
}
