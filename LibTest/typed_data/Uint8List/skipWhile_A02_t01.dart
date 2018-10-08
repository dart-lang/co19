/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E element))
 * ...
 * The filtering happens lazily.
 * @description Checks that [test] is not invoked until returned [Iterable] is
 * not iterated.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  bool test(int e) {
    ++count;
    return false;
  }

  var list = new Uint8List.fromList([1, 2, 3]);
  var res = list.skipWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(1, count);
}
