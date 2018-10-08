/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * If iterable is based on this list, its values may change /during/ the setAll
 * operation.
 * @description Checks that iterable values may change /during/ the setAll
 * operation, if iterable is based on this list.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var l = new Int32List.fromList(list);
  var buffer = l.buffer;
  var iterable = new Int32List.view(buffer, 8, 4);

  for (int i = 0; i < iterable.length; ++i) {
    Expect.equals(list[i + 2], iterable[i]);
  }

  l.setAll(1, iterable);
  Expect.listEquals([0, 2, 3, 4, 5, 5, 6, 7, 8, 9], l);

  l.setAll(4, iterable);
  Expect.listEquals([0, 2, 3, 4, 3, 4, 5, 5, 8, 9], l);

  for (int i = 0; i < iterable.length; ++i) {
    Expect.notEquals(list[i + 2], iterable[i]);
  }
}
