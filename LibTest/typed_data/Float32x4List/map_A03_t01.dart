/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<t>(T f(E e))
 * The transformed elements will not be cached. Iterating multiple times
 * over the the returned [Iterable] will invoke the supplied function [f]
 * multiple times on the same element.
 * @description Checks that [f] will be invoked every time [Iterable] is
 * iterated.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var count = 0;
  f(e) {
    count++;
    return e;
  }

  var l = new Float32x4List.fromList(
      [pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
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
