/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the next element in the iteration.
 * @description Tries to check that the next element in the iteration is got
 * when the list is changed.
 * @author vasya
 * @needsreview
 * @reviewer msyabro
 */


main() {
  List a = [0,1,2,3,4,5];
  Iterator it = a.iterator();
  a.length = 3;
  Expect.equals(it.next(), 0);
  Expect.equals(it.next(), 1);
  Expect.equals(it.next(), 2);

  try {
    it.next();
    Expect.fail("NoMoreElementsException expected when calling it.next()");
  } catch( NoMoreElementsException ok ) { }
}
