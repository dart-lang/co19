/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * ...
 * The returned [Iterable] may contain fewer than [count] elements, if [this]
 * contains fewer than [count] elements.
 * @description Checks that the returned [Iterable] contains fewer then [count]
 * elements if [this] contains fewer then [count] elements.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> list, int n) {
  var l = new Float32List.fromList(list);
  var res = l.take(n);
  Expect.equals(l.length, res.length);

  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i], res.elementAt(i));
  }
}

main() {
  check([], 100);
  check([1.0], 5);

  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], 11);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], 1000000);

}
