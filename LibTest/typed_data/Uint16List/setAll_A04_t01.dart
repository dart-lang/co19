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
  var l = new Uint16List.fromList(list);
  var buffer = l.buffer;
  var l1 = new Uint16List.view(buffer, 6, 4);
  for (int i = 0; i < l1.length; ++i) {
    Expect.equals(list[i + 3], l1[i]);
  }

  l.setAll(2, l1);
  for (int i = 0; i < l1.length - 1; ++i) {
    Expect.notEquals(list[i + 3], l1[i]);
  }
  Expect.equals(list[2 + l1.length], l1[l1.length - 1]);

  l.setAll(6, l1);
  for (int i = 0; i < l1.length; ++i) {
    Expect.notEquals(list[i + 3], l1[i]);
  }
}
