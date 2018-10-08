/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E e))
 * ...
 * This method returns a view of the mapped elements. As long as the returned
 * Iterable is not iterated over, the supplied function f will not be invoked.
 * @description Checks that the supplied function f is invoked when returned
 * Iterable is iterated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2(v, v+1);

main() {
  bool invoked = false;
  f(e) {
    invoked= true;
    return e;
  }
  var l = new Float64x2List.fromList(
      [f64x2(5.0), f64x2(7.0), f64x2(9.0), f64x2(11.0)]
  );
  var res = l.map(f);

  Expect.isFalse(invoked);
  Expect.equals(5.0, res.elementAt(0).x);
  Expect.isTrue(invoked);
}
