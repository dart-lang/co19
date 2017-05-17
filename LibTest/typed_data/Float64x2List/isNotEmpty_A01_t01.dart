/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNotEmpty
 * Returns true if there is at least one element in this collection.
 * @description Checks that isNotEmpty returns true, if at least one element in
 * this collection.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj;

  obj = new Float64x2List(2);
  Expect.isTrue(obj.isNotEmpty);
  obj = new Float64x2List(0);
  Expect.isFalse(obj.isNotEmpty);

  obj = new Float64x2List.fromList([]);
  Expect.isFalse(obj.isNotEmpty);
  obj = new Float64x2List.fromList([new Float64x2(1.0, 2.0)]);
  Expect.isTrue(obj.isNotEmpty);
}
