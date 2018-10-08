/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEmpty
 * Returns true if there is no element in this collection.
 * @description Checks that this method returns true iff [this] has no elements.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l;

  l = new Int8List(0);
  Expect.isTrue(l.isEmpty);
  l = new Int8List(1);
  Expect.isFalse(l.isEmpty);

  l = new Int8List.fromList([]);
  Expect.isTrue(l.isEmpty);
  l = new Int8List.fromList([0, 0, 0]);
  Expect.isFalse(l.isEmpty);
}
