/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E e))
 * ...
 * The transformed elements will not be cached. Iterating multiple times over
 * the returned [Iterable] will invoke the supplied function [f] multiple times
 * on the same element.
 * @description Checks that [f] will be invoked every time [Iterable] is
 * iterated.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  int f(int e) {
    count++;
    return e;
  }

  var l = new Int64List.fromList([1, 2, 3, 4, 5]);
  var res = l.map(f);

  res.elementAt(0);
  Expect.equals(1, count);

  res.elementAt(0);
  Expect.equals(2, count);

  res.elementAt(3);
  Expect.equals(3, count);

  res.elementAt(3);
  Expect.equals(4, count);

  res.elementAt(1);
  Expect.equals(5, count);
}
