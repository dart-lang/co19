/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * ...
 * As long as the returned [Iterable] is not iterated over, the supplied
 * function [test] will not be invoked.
 * @description Checks that as long as the returned [Iterable] is not iterated
 * over, the supplied function [test] will not be invoked.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  bool test(e) {
    ++count;
    return true;
  }

  var list = new Float64List.fromList([1.0, 2.0, 3.0]);
  var res = list.where(test);

  Expect.equals(0,count);
  res.elementAt(0);
  Expect.equals(1,count);
}
