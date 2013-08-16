/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * It is an error if the index does not point inside the list
 * or at the position after the last element.
 * @description Checks that an error is thrown if [index]
 * is out of bounds.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(list) {
  var l = new Int64List.fromList(list);
  try {
    l.setAll(-1, []);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.setAll(list.length, []);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.setAll(0x80000000, []);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.setAll(0x7fffffff, []);
    Expect.fail("Error is expected");
  } catch(ok) {}
}

main() {
  check([]);
  check([1]);
  check([0,0,0,0,0,0,0,0,0,0]);
}

