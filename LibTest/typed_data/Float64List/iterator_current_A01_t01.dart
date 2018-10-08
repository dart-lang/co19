/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E current
 * Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void checkNext(List<double> list) {
  var l = new Float64List.fromList(list);
  var it = l.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(l[i++], it.current);
  }
}

main() {
  checkNext([1.0]);
  checkNext([1.0, 2.0, 3.0]);

  var a = new List<double>(255);
  for (var i = 0; i < a.length; i++) {
    a[i] = (a.length - i) * 1.0;
  }
  checkNext(a);
}
