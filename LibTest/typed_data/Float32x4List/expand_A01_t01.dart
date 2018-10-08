/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand<T>(Iterable<T> f(E element))
 * Expand each element of this Iterable into zero or more elements.
 * The resulting Iterable will run through the elements returned by f for each
 * element of this, in iteration order.
 * @description Checks that the returned [Iterable] contains correct elements
 * and has the correct length.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);

  var res = l.expand((element) => [element * pack(2.0)]);
  Expect.equals(list.length, res.length);
  for (int i = 0; i < list.length; ++i) {
    Expect.isTrue(res.elementAt(i).equal(list[i] * pack(2.0)).flagX);
    Expect.isTrue(res.elementAt(i).equal(list[i] * pack(2.0)).flagY);
    Expect.isTrue(res.elementAt(i).equal(list[i] * pack(2.0)).flagZ);
    Expect.isTrue(res.elementAt(i).equal(list[i] * pack(2.0)).flagW);
  }

  res = l.expand((element) => [element, element * pack(2.0)]);
  Expect.equals(list.length * 2, res.length);
  for (int i = 0; i < list.length; ++i) {
    Expect.isTrue(res.elementAt(2 * i).equal(list[i]).flagX);
    Expect.isTrue(res.elementAt(2 * i).equal(list[i]).flagY);
    Expect.isTrue(res.elementAt(2 * i).equal(list[i]).flagZ);
    Expect.isTrue(res.elementAt(2 * i).equal(list[i]).flagW);

    Expect.isTrue(res.elementAt(2 * i + 1).equal(list[i] * pack(2.0)).flagX);
    Expect.isTrue(res.elementAt(2 * i + 1).equal(list[i] * pack(2.0)).flagY);
    Expect.isTrue(res.elementAt(2 * i + 1).equal(list[i] * pack(2.0)).flagZ);
    Expect.isTrue(res.elementAt(2 * i + 1).equal(list[i] * pack(2.0)).flagW);
  }

  res = l.expand((element) => []);
  Expect.equals(0, res.length);
}

main() {
  check([]);
  check([pack(1.0)]);
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ]);
}
