/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function [f] to each element of this collection in iteration
 * order.
 * @description Checks that the function [f] is called for each element of the
 * list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List(0);
  var res = 0;
  l.forEach((e) {
    res += e;
  });
  Expect.equals(0, res);

  l = new Int64List.fromList([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);
  l.forEach((e) {
    res += e;
  });
  Expect.equals(10, res);
}
