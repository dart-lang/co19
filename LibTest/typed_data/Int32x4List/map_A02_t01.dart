/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E e))
 * ...
 * As long as the returned Iterable is not iterated over, the supplied function
 * f will not be invoked.
 * @description Checks that as long as the returned Iterable is not iterated
 * over, the supplied function f will not be invoked.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var counter = false;
  f(e) {
    counter = true;
    return e.z;
  }
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(1), i32x4(3), i32x4(4)];
  var l = new Int32x4List.fromList(list);
  var res = l.map(f);

  Expect.isFalse(counter);
  res.elementAt(0);
  Expect.isTrue(counter);
}
