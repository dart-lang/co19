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
  var l = new Float64List.fromList(
      [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]);

  l.setAll(4, l.getRange(1, 3));
  Expect.listEquals([0.0, 1.0, 2.0, 3.0, 1.0, 2.0, 6.0, 7.0, 8.0, 9.0], l);

  l.setAll(2, l.getRange(1, 4));
  Expect.listEquals([0.0, 1.0, 1.0, 2.0, 3.0, 2.0, 6.0, 7.0, 8.0, 9.0], l);

  l.setAll(0, l.getRange(2, 7));
  Expect.listEquals([1.0, 2.0, 3.0, 2.0, 6.0, 2.0, 6.0, 7.0, 8.0, 9.0], l);
}
