/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * The filtering happens lazily.
 * @description Checks that [test] is not invoked until returned [Iterable] is
 * not iterated.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var count = 0;
  test(e) {
    ++count;
    return true;
  }

  var list = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0)]);
  var res = list.takeWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(1, count);
}
