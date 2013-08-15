/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void replaceRange(int start, int end, Iterable<E> iterable)
 * Removes the elements in the range start to end exclusive and
 * replaces them with the contents of the iterable.
 * Throws an UnsupportedError, if the length of [this] cannot be changed.
 * @description Checks that [UnsupportedError] is thrown
 * since [Uint16List] is a fixed-size list.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(list) {
  var l = new Uint16List.fromList(list);
  var length = l.length;
  try {
    l.replaceRange(0,1,[0]);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError catch(ok) {};
  Expect.equals(length, l.length);

  try {
    l.replaceRange(0,100,[0, 1, 2]);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError catch(ok) {};
  Expect.equals(length, l.length);

}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5]);
}
