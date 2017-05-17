/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEmpty
 * Returns true if there are no elements in this collection.
 * @description Checks that isEmpty returns true, if the object is empty, and
 * false otherwise.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj;

  obj = new Float64x2List(0);
  Expect.isTrue(obj.isEmpty);
  obj = new Float64x2List(2);
  Expect.isFalse(obj.isEmpty);

  obj = new Float64x2List.fromList([]);
  Expect.isTrue(obj.isEmpty);
  obj = new Float64x2List.fromList([new Float64x2(1.0, 2.0)]);
  Expect.isFalse(obj.isEmpty);
}
