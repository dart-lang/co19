/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNotEmpty
 * Returns true if there is at least one element in this collection.
 * @description Checks that this method returns true iff [this] has at least
 * one element.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l;

  l = new Uint64List(0);
  Expect.isFalse(l.isNotEmpty);
  l = new Uint64List(1);
  Expect.isTrue(l.isNotEmpty);

  l = new Uint64List.fromList([]);
  Expect.isFalse(l.isNotEmpty);
  l = new Uint64List.fromList([0, 0, 0]);
  Expect.isTrue(l.isNotEmpty);
}
