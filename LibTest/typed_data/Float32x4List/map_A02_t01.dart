/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<t>(T f(E e))
 * ...
 * As long as the returned [Iterable] is not iterated over, the supplied
 * function [f] will not be invoked.
 * @description Checks that [f] will not be invoked until the returned
 * [Iterable] is not iterated over.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  bool invoked = false;
  f(e) {
    invoked = true;;
    return e;
  }

  var l = new Float32x4List.fromList(
      [pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
  var res = l.map(f);

  Expect.isFalse(invoked);
  res.elementAt(0);
  Expect.isTrue(invoked);
}
