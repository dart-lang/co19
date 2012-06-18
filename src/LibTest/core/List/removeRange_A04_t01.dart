/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [IllegalArgumentException] if [length] is negative.
 * @description Checks that an [IllegalArgumentException] is thrown 
 * if [length] is negative.
 * @author vasya
 * @reviewer iefremov
 */

check(list) {
  try {
    list.removeRange(0, -1);
    Expect.fail("IllegalArgumentException expected when calling List.removeRange()");
  } catch(IllegalArgumentException ok) {}
}

main() {
  var a = new List();
  a.length = 1;
  check(a);
  check([1]);
  check(new List.from([1]));
}
