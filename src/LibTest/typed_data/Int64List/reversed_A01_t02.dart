/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterable<E> reversed
 * Returns an [Iterable] of the elements of this [List] in reverse order.
 * @description Checks that [reversed] is final and can't be set.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(list) {
  var l = new Int64List.fromList(list);
  try {
    l.reversed = list;
    Expect.fail("[reversed] should be final");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  check([]);
  var list = new List(255);
  for(int i = 0; i < 255; ++i) {
    list[i] = i;
  }
  check(list);
}
