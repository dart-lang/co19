/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEmpty
 * Returns true if there is at least one element in this collection.
 * @description Checks that true is returned if an instance of Int32x4List
 * contains at least one element, false otherwise.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var l = new Int32x4List(0);
  Expect.isFalse(l.isNotEmpty);
  l = new Int32x4List(1);
  Expect.isTrue(l.isNotEmpty);

  l = new Int32x4List.fromList([]);
  Expect.isFalse(l.isNotEmpty);
  l = new Int32x4List.fromList([i32x4(11), i32x4(12)]);
  Expect.isTrue(l.isNotEmpty);

  var buffer = l.buffer;
  l = new Int32x4List.view(buffer, 0, 0);
  Expect.isFalse(l.isNotEmpty);
  l = new Int32x4List.view(buffer, 0, 1);
  Expect.isTrue(l.isNotEmpty);
}
