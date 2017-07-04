/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * Overwrites objects of this with the objects of [iterable], starting at
 * position [index] in the list.
 * This operation does not increase the length of [this].
 * @description Checks that method overwrites elements correctly.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64List.fromList(
      [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);

  l.setAll(9, [1.0]);
  Expect.listEquals([0, 0, 0, 0, 0, 0, 0, 0, 0, 1.0], l);

  l.setAll(2, [2.0, 2.0, 2.0, 2.0]);
  Expect.listEquals([0, 0, 2.0, 2.0, 2.0, 2.0, 0, 0, 0, 1.0], l);

  l.setAll(0, [3.0, 3.0, 3.0, 3.0, 3.0]);
  Expect.listEquals([3.0, 3.0, 3.0, 3.0, 3.0, 2.0, 0, 0, 0, 1.0], l);

  l.setAll(0, [11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0]);
  Expect.listEquals(
      [11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0], l);

  l.setAll(0, []);
  Expect.listEquals(
      [11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0], l);
}
