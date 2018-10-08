/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E element))
 * ...
 * As long as the returned [Iterable] is not iterated over, the supplied
 * function [f] will not be invoked.
 * @description Checks that [f] will not be invoked until the returned
 * [Iterable] is not iterated over.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  bool invoked = false;
  f(e) {
    invoked = true;;
    return e;
  }

  var l = new Float64List.fromList([1.0, 2.0, 3.0, 4.0, 5.0]);
  var res = l.map(f);

  Expect.isFalse(invoked);
  res.elementAt(0);
  Expect.isTrue(invoked);
}
