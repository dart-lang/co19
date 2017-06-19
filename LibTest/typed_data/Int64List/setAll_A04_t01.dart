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
 * @description Checks that method overwrites elements correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

  l.setAll(4, l.getRange(1, 3));
  Expect.listEquals([0, 1, 2, 3, 1, 2, 6, 7, 8, 9], l);

  l.setAll(2, l.getRange(1, 4));
  Expect.listEquals([0, 1, 1, 2, 3, 2, 6, 7, 8, 9], l);

  l.setAll(0, l.getRange(2, 7));
  Expect.listEquals([1, 2, 3, 2, 6, 2, 6, 7, 8, 9], l);
}
