/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * ...
 * The iterable must have at least one element.
 * @description Checks that a [StateError] is thrown, if iterable is empty.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List.fromList([]);
  try {
    l.reduce((prev, cur) => 0);
    Expect.fail("StateError is expected");
  } on StateError {}
}
