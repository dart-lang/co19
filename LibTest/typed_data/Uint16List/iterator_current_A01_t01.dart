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

void checkNext(List<int> list) {
  var l = new Uint16List.fromList(list);
  var it = l.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(l[i++], it.current);
  }
}

main() {
  checkNext([1]);
  checkNext([1, 2, 3]);

  var a = new List<int>(255);
  for (var i = 0; i < a.length; i++) {
    a[i] = a.length - i;
  }
  checkNext(a);
}
