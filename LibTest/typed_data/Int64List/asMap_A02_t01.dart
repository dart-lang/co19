/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<int, E> asMap()
 * ...
 * The [Map.keys] [Iterable] iterates the indices of this list in numerical
 * order.
 * @description Checks that the [Maps.keys] iterates the indices in numerical
 * order.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int64List.fromList(list);
  var iterable = l.asMap().keys;
  var it = iterable.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(i++, it.current);
  }
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);
}
