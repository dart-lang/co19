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
 * @description Checks that values of iterable may change if iterable is based
 * on this list.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var l = new Int16List.fromList(list);
  var buffer = l.buffer;
  var l2 = new Int16List.view(buffer, 6, 4);

  for (int i = 0; i < l2.length; ++i) {
    Expect.equals(list[i + 3], l2[i]);
  }

  l.setAll(2, l2);
  for (int i = 0; i < l2.length - 1; ++i) {
    Expect.notEquals(list[i + 3], l2[i]);
  }
  Expect.equals(list[6], l2[3]);
}
